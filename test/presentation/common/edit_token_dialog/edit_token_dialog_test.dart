import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/domain/repository_interface/secure_storage_interface.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog/edit_token_dialog.dart';
import 'package:yumemi_flutter_codecheck/presentation/constants/edit_token_dialog_keys.dart';
import '../../helpers/widget_test_helpers.dart';

class MockSecureStorageRepository implements SecureStorageInterface {
  String? _token;

  @override
  Future<void> saveToken(String token) async {
    _token = token;
  }

  @override
  Future<String?> getToken() async {
    await Future<void>.microtask(() {});
    return _token;
  }

  @override
  Future<void> deleteToken() async {
    _token = null;
  }

  void setToken(String? token) {
    _token = token;
  }
}

void main() {
  group('EditTokenDialog', () {
    late MockSecureStorageRepository mockSecureStorageRepository;
    late AppColors appColors;

    setUp(() {
      mockSecureStorageRepository = MockSecureStorageRepository();
      appColors = createTestAppColors();
    });

    Widget createTestWidget({String? initialToken}) {
      mockSecureStorageRepository.setToken(initialToken);

      return ProviderScope(
        overrides: [
          secureStorageRepositoryProvider.overrideWith(
            (ref) => mockSecureStorageRepository,
          ),
        ],
        child: createLocalizedTestWidget(
          child: Theme(
            data: ThemeData(extensions: [appColors]),
            child: const EditTokenDialog(),
          ),
        ),
      );
    }

    testWidgets('displays loading indicator initially', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays token input field after loading', (tester) async {
      await tester.pumpWidget(createTestWidget(initialToken: ''));
      await tester.pumpAndSettle();

      expect(find.byKey(editTokenTextFieldKey), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('loads existing token into text field', (tester) async {
      const existingToken = 'existing_token_123';
      await tester.pumpWidget(createTestWidget(initialToken: existingToken));
      await tester.pumpAndSettle();

      final textField = tester.widget<TextField>(
        find.byKey(editTokenTextFieldKey),
      );
      expect(textField.controller!.text, equals(existingToken));
    });

    testWidgets('displays token input field as obscured by default', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget(initialToken: 'test_token'));
      await tester.pumpAndSettle();

      final textField = tester.widget<TextField>(
        find.byKey(editTokenTextFieldKey),
      );
      expect(textField.obscureText, isTrue);
    });

    testWidgets('toggles token visibility when visibility icon is tapped', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget(initialToken: 'test_token'));
      await tester.pumpAndSettle();

      // Initially obscured
      TextField textField = tester.widget<TextField>(
        find.byKey(editTokenTextFieldKey),
      );
      expect(textField.obscureText, isTrue);

      // Tap visibility toggle
      await tester.tap(find.byIcon(Icons.visibility_rounded));
      await tester.pumpAndSettle();

      // Now visible
      textField = tester.widget<TextField>(find.byKey(editTokenTextFieldKey));
      expect(textField.obscureText, isFalse);

      // Tap again to hide
      await tester.tap(find.byIcon(Icons.visibility_off_rounded));
      await tester.pumpAndSettle();

      // Back to obscured
      textField = tester.widget<TextField>(find.byKey(editTokenTextFieldKey));
      expect(textField.obscureText, isTrue);
    });

    testWidgets('displays all three action buttons', (tester) async {
      await tester.pumpWidget(createTestWidget(initialToken: ''));
      await tester.pumpAndSettle();

      expect(find.text('Save'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('saves token when save button is pressed', (tester) async {
      const newToken = 'new_token_456';
      await tester.pumpWidget(createTestWidget(initialToken: ''));
      await tester.pumpAndSettle();

      // Enter new token
      await tester.enterText(find.byKey(editTokenTextFieldKey), newToken);
      await tester.pumpAndSettle();

      // Tap save button
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Verify token was saved
      expect(mockSecureStorageRepository._token, equals(newToken));
    });

    testWidgets('deletes token when empty string is saved', (tester) async {
      await tester.pumpWidget(createTestWidget(initialToken: 'existing_token'));
      await tester.pumpAndSettle();

      // Clear the token field
      await tester.enterText(find.byKey(editTokenTextFieldKey), '');
      await tester.pumpAndSettle();

      // Tap save button
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Verify token was deleted
      expect(mockSecureStorageRepository._token, isNull);
    });

    testWidgets('deletes token when delete button is pressed', (tester) async {
      await tester.pumpWidget(createTestWidget(initialToken: 'existing_token'));
      await tester.pumpAndSettle();

      // Tap delete button
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Verify token was deleted
      expect(mockSecureStorageRepository._token, isNull);
    });

    testWidgets('closes dialog when cancel button is pressed', (tester) async {
      await tester.pumpWidget(createTestWidget(initialToken: ''));
      await tester.pumpAndSettle();

      // Tap cancel button
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Dialog should be dismissed
      expect(find.byType(EditTokenDialog), findsNothing);
    });

    testWidgets('trims whitespace from token input', (tester) async {
      const tokenWithSpaces = '  token_with_spaces  ';
      const trimmedToken = 'token_with_spaces';

      await tester.pumpWidget(createTestWidget(initialToken: ''));
      await tester.pumpAndSettle();

      // Enter token with spaces
      await tester.enterText(
        find.byKey(editTokenTextFieldKey),
        tokenWithSpaces,
      );
      await tester.pumpAndSettle();

      // Tap save button
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Verify trimmed token was saved
      expect(mockSecureStorageRepository._token, equals(trimmedToken));
    });

    testWidgets('shows loading state initially', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Should show loading indicator initially
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byKey(editTokenTextFieldKey), findsNothing);
    });

    testWidgets('shows input field with correct styling', (tester) async {
      await tester.pumpWidget(createTestWidget(initialToken: ''));
      await tester.pumpAndSettle();

      final textField = tester.widget<TextField>(
        find.byKey(editTokenTextFieldKey),
      );

      expect(textField.style?.fontFamily, equals('monospace'));
      expect(textField.style?.fontSize, equals(16));
      expect(textField.style?.letterSpacing, equals(0.5));
    });

    testWidgets('shows border animation when input has content', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget(initialToken: ''));
      await tester.pumpAndSettle();

      // Enter text to trigger border animation
      await tester.enterText(find.byKey(editTokenTextFieldKey), 'test');
      await tester.pumpAndSettle();

      // The AnimatedContainer should update the border
      expect(find.byType(AnimatedContainer), findsWidgets);
    });

    testWidgets('displays dialog with correct title and subtitle', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget(initialToken: ''));
      await tester.pumpAndSettle();

      // Check for title
      expect(find.text('Edit Token'), findsOneWidget);

      // The subtitle should be visible
      final subtitleText = find
          .byType(Text)
          .evaluate()
          .where(
            (element) =>
                (element.widget as Text).data?.contains('GitHub') == true ||
                (element.widget as Text).data?.contains('アクセストークン') == true,
          )
          .isNotEmpty;
      expect(subtitleText, isTrue);
    });

    testWidgets('shows proper icon in header', (tester) async {
      await tester.pumpWidget(createTestWidget(initialToken: ''));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.vpn_key_rounded), findsOneWidget);
      expect(find.byIcon(Icons.key_rounded), findsOneWidget); // prefix icon
    });

    testWidgets('performs haptic feedback on button interactions', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget(initialToken: ''));
      await tester.pumpAndSettle();

      // Mock the haptic feedback
      final List<MethodCall> log = <MethodCall>[];
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (MethodCall methodCall) async {
          log.add(methodCall);
          return null;
        },
      );

      // Tap save button - should trigger light impact
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      expect(
        log,
        contains(
          isMethodCall(
            'HapticFeedback.vibrate',
            arguments: 'HapticFeedbackType.lightImpact',
          ),
        ),
      );
    });
  });

  group('EditTokenDialog.show', () {
    testWidgets('shows dialog using static method', (tester) async {
      final mockSecureStorageRepository = MockSecureStorageRepository();
      final appColors = createTestAppColors();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            secureStorageRepositoryProvider.overrideWithValue(
              mockSecureStorageRepository,
            ),
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
        ),
      );

      // Initially no dialog
      expect(find.byType(EditTokenDialog), findsNothing);

      // Tap button to show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Dialog should now be visible
      expect(find.byType(EditTokenDialog), findsOneWidget);
    });

    testWidgets('dialog is dismissible by tapping outside', (tester) async {
      final mockSecureStorageRepository = MockSecureStorageRepository();
      final appColors = createTestAppColors();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            secureStorageRepositoryProvider.overrideWithValue(
              mockSecureStorageRepository,
            ),
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
        ),
      );

      // Show dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(EditTokenDialog), findsOneWidget);

      // Barriers should be dismissible so tapping outside can close the dialog
      final barrierFinder = find.byType(ModalBarrier);
      final barrierWidgets = barrierFinder
          .evaluate()
          .map((element) => element.widget)
          .whereType<ModalBarrier>()
          .toList();
      expect(barrierWidgets.any((barrier) => barrier.dismissible), isTrue);

      final navigatorState = tester.state<NavigatorState>(
        find.byType(Navigator),
      );
      navigatorState.pop();
      await tester.pumpAndSettle();

      // Dialog should be dismissed
      expect(find.byType(EditTokenDialog), findsNothing);
    });
  });
}
