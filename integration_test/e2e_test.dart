import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:yumemi_flutter_codecheck/application/app.dart';
import 'package:yumemi_flutter_codecheck/application/flavors.dart';
import 'package:yumemi_flutter_codecheck/core/provider/overrides/prefs/prefs_provider.dart';
import 'package:yumemi_flutter_codecheck/core/provider/datasource/github/github_api_client_provider.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/presentation/constants/edit_token_dialog_keys.dart';
import 'helpers/fakes.dart';

void main() {
  // Use the standard test binding to avoid integration_test's tearDownAll hooks
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('End-to-end: search → open detail → back', (tester) async {
    // Use in-memory SharedPreferences
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final fakeSecureStorage = FakeSecureStorageRepository();

    // Set flavor explicitly for tests
    F.appFlavor = Flavor.dev;

    // Launch the app with provider overrides (prefs + fake API)
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          prefsProvider.overrideWithValue(prefs),
          githubApiClientProvider(
            token: null,
          ).overrideWithValue(FakeGitHubApiClient()),
          secureStorageRepositoryProvider.overrideWithValue(fakeSecureStorage),
        ],
        child: const App(),
      ),
    );

    // Allow initial load + entrance animations (long enough to be safe)
    await tester.pump(const Duration(seconds: 1));

    // Home header is visible
    expect(find.text('GitHub'), findsOneWidget);

    final tokenButton = find.byIcon(Icons.vpn_key_rounded);
    expect(tokenButton, findsOneWidget);

    final textFieldFinder = find.byKey(editTokenTextFieldKey);

    Future<void> waitForTokenField() async {
      for (var i = 0; i < 10; i++) {
        if (textFieldFinder.evaluate().isNotEmpty) {
          return;
        }
        await tester.pump(const Duration(milliseconds: 50));
      }
      fail('Token text field did not appear');
    }

    await tester.tap(tokenButton);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    await waitForTokenField();

    final firstTextField = tester.widget<TextField>(textFieldFinder);
    expect(firstTextField.controller?.text ?? '', isEmpty);

    await tester.enterText(textFieldFinder, 'example-token');
    await tester.pump();

    final saveButton = find.byKey(editTokenSaveButtonKey);
    expect(saveButton, findsOneWidget);
    await tester.tap(saveButton);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(await fakeSecureStorage.getToken(), 'example-token');

    await tester.tap(tokenButton);
    await tester.pump();
    await waitForTokenField();

    final secondTextField = tester.widget<TextField>(textFieldFinder);
    expect(secondTextField.controller?.text, 'example-token');

    final cancelButton = find.byKey(editTokenCancelButtonKey);
    expect(cancelButton, findsOneWidget);
    await tester.tap(cancelButton);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(await fakeSecureStorage.getToken(), 'example-token');

    await tester.tap(tokenButton);
    await tester.pump();
    await waitForTokenField();

    final thirdTextField = tester.widget<TextField>(textFieldFinder);
    expect(thirdTextField.controller?.text, 'example-token');

    final deleteButton = find.byKey(editTokenDeleteButtonKey);
    expect(deleteButton, findsOneWidget);
    await tester.tap(deleteButton);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(await fakeSecureStorage.getToken(), isNull);

    await tester.pump(const Duration(milliseconds: 200));

    await tester.pump(const Duration(seconds: 10));
    // Two fake repositories are listed; pick one by its full name
    final repoTile = find.text('flutter/flutter');
    expect(repoTile, findsOneWidget);
    // List view is present
    expect(find.byType(ListView), findsWidgets);

    // Tap the repository to navigate to detail
    await tester.tap(repoTile);
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 3));

    // AppBar title shows the full repo name
    expect(find.text('flutter/flutter'), findsWidgets);

    // AppBarの戻るボタン（BackButtonまたはarrow_backアイコン）を探して戻る
    final backFinder = find.byWidgetPredicate((widget) => widget is BackButton);
    expect(backFinder, findsWidgets);
    await tester.ensureVisible(backFinder.first);
    await tester.tap(backFinder);
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 2));

    // // Ensure we are back on home (header still visible)
    expect(find.text('GitHub'), findsOneWidget);

    // Clear the existing query and search for another repository
    final clearSearchButton = find.byIcon(Icons.clear_rounded);
    expect(clearSearchButton, findsOneWidget);
    await tester.tap(clearSearchButton);
    await tester.pump(const Duration(milliseconds: 200));

    final searchField = find.byType(TextFormField);
    await tester.enterText(searchField, 'react-native');
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(seconds: 1));

    final reactNativeTile = find.text('facebook/react-native');
    expect(reactNativeTile, findsOneWidget);
    await tester.tap(reactNativeTile);
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 3));

    expect(find.text('facebook/react-native'), findsWidgets);

    final secondBackButtonFinder = find.byWidgetPredicate(
      (widget) => widget is BackButton,
    );
    expect(secondBackButtonFinder, findsWidgets);
    await tester.ensureVisible(secondBackButtonFinder.first);
    await tester.tap(secondBackButtonFinder);
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('GitHub'), findsOneWidget);

    // Toggle theme using the header button in the top bar
    final themeToggleButton = find.byIcon(Icons.light_mode_rounded);
    expect(themeToggleButton, findsOneWidget);
    await tester.tap(themeToggleButton);
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.dark_mode_rounded), findsOneWidget);
  });
}
