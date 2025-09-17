import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/domain/repository_interface/secure_storage_interface.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog/edit_token_dialog.dart';
import 'package:yumemi_flutter_codecheck/presentation/constants/edit_token_dialog_keys.dart';
import '../../helpers/widget_test_helpers.dart';

class MockSecureStorage implements SecureStorageInterface {
  String? _token;

  @override
  Future<String?> getToken() async {
    await Future<void>.microtask(() {});
    return _token;
  }

  @override
  Future<void> saveToken(String token) async {
    _token = token;
  }

  @override
  Future<void> deleteToken() async {
    _token = null;
  }

  void setInitialToken(String? token) => _token = token;
}

void main() {
  group('EditTokenDialog Widget Tests', () {
    late AppColors appColors;

    setUp(() {
      appColors = createTestAppColors();
    });

    Widget createTestWidget({MockSecureStorage? storage}) {
      final mockStorage = storage ?? MockSecureStorage();

      return ProviderScope(
        overrides: [
          secureStorageRepositoryProvider.overrideWithValue(mockStorage),
        ],
        child: createLocalizedTestWidget(
          child: Theme(
            data: ThemeData(extensions: [appColors]),
            child: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => EditTokenDialog.show(context),
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('shows dialog using static method', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Initially no dialog
      expect(find.byType(EditTokenDialog), findsNothing);

      // Tap button to show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Dialog should now be visible
      expect(find.byType(EditTokenDialog), findsOneWidget);
    });

    testWidgets('dialog contains expected UI elements', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Check for key UI elements
      expect(find.byIcon(Icons.vpn_key_rounded), findsOneWidget);
      expect(find.text('Save'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('initially shows loading state', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pump(); // Don't settle, just pump once

      // Should show loading initially
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('dialog is dismissible by barrier tap', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(EditTokenDialog), findsOneWidget);

      // Tap outside dialog (barrier tap)
      await tester.tapAt(const Offset(50, 50));
      await tester.pumpAndSettle();

      // Dialog should be dismissed
      expect(find.byType(EditTokenDialog), findsNothing);
    });

    testWidgets('dialog has proper styling and animations', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Check for animated components
      expect(find.byType(AnimatedBuilder), findsWidgets);
      expect(find.byType(Dialog), findsOneWidget);

      // Check for container styling
      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(Dialog),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.decoration, isA<BoxDecoration>());
    });

    testWidgets('shows input field after loading completes', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Show dialog and wait for loading to complete
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Should eventually show the text field (once loading completes)
      expect(find.byKey(editTokenTextFieldKey), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });
}
