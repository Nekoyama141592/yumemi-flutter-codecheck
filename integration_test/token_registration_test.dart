import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:yumemi_flutter_codecheck/application/app.dart';
import 'package:yumemi_flutter_codecheck/application/flavors.dart';
import 'package:yumemi_flutter_codecheck/core/provider/datasource/github/github_api_client_provider.dart';
import 'package:yumemi_flutter_codecheck/core/provider/overrides/prefs/prefs_provider.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/components/edit_token_dialog_keys.dart';

import 'helpers/fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration: token registration and deletion', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final fakeSecureStorage = FakeSecureStorageRepository();

    F.appFlavor = Flavor.dev;

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

    await tester.pump(const Duration(seconds: 1));

    final tokenButton = find.byIcon(Icons.vpn_key_rounded);
    expect(tokenButton, findsOneWidget);

    await tester.tap(tokenButton);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

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
  });
}
