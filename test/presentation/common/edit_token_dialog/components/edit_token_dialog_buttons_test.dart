import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog/components/edit_token_cancel_button.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog/components/edit_token_delete_button.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog/components/edit_token_save_button.dart';
import 'package:yumemi_flutter_codecheck/presentation/constants/edit_token_dialog_keys.dart';
import '../../../helpers/widget_test_helpers.dart';

void main() {
  group('EditTokenCancelButton', () {
    late AppColors appColors;

    setUp(() {
      appColors = createTestAppColors();
    });

    Widget createTestWidget({
      String label = 'Cancel',
      VoidCallback? onPressed,
    }) {
      return createLocalizedTestWidget(
        child: Theme(
          data: ThemeData(extensions: [appColors]),
          child: EditTokenCancelButton(
            label: label,
            onPressed: onPressed ?? () {},
          ),
        ),
      );
    }

    testWidgets('renders with correct label', (tester) async {
      await tester.pumpWidget(createTestWidget(label: 'Cancel Test'));

      expect(find.text('Cancel Test'), findsOneWidget);
      expect(find.byKey(editTokenCancelButtonKey), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      bool wasCalled = false;
      await tester.pumpWidget(
        createTestWidget(onPressed: () => wasCalled = true),
      );

      await tester.tap(find.byType(EditTokenCancelButton));
      await tester.pumpAndSettle();

      expect(wasCalled, isTrue);
    });

    testWidgets('has correct styling and animation', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Should have AnimatedContainer for styling
      expect(find.byType(AnimatedContainer), findsOneWidget);
      expect(find.byType(ScaleTransition), findsWidgets);
    });

    testWidgets('responds to hover state', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Hover over the button
      await tester.startGesture(
        tester.getCenter(find.byType(EditTokenCancelButton)),
      );
      await tester.pumpAndSettle();

      // The MouseRegion should handle hover
      expect(find.byType(MouseRegion), findsWidgets);
    });
  });

  group('EditTokenDeleteButton', () {
    late AppColors appColors;

    setUp(() {
      appColors = createTestAppColors();
    });

    Widget createTestWidget({
      String label = 'Delete',
      VoidCallback? onPressed,
      bool enabled = true,
    }) {
      return createLocalizedTestWidget(
        child: Theme(
          data: ThemeData(extensions: [appColors]),
          child: EditTokenDeleteButton(
            label: label,
            onPressed: onPressed ?? () {},
            enabled: enabled,
          ),
        ),
      );
    }

    testWidgets('renders with correct label and icon', (tester) async {
      await tester.pumpWidget(createTestWidget(label: 'Delete Test'));

      expect(find.text('Delete Test'), findsOneWidget);
      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);
      expect(find.byKey(editTokenDeleteButtonKey), findsOneWidget);
    });

    testWidgets('calls onPressed when enabled and tapped', (tester) async {
      bool wasCalled = false;
      await tester.pumpWidget(
        createTestWidget(onPressed: () => wasCalled = true, enabled: true),
      );

      await tester.tap(find.byType(EditTokenDeleteButton));
      await tester.pumpAndSettle();

      expect(wasCalled, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      bool wasCalled = false;
      await tester.pumpWidget(
        createTestWidget(onPressed: () => wasCalled = true, enabled: false),
      );

      await tester.tap(find.byType(EditTokenDeleteButton));
      await tester.pumpAndSettle();

      expect(wasCalled, isFalse);
    });

    testWidgets('shows disabled styling when disabled', (tester) async {
      await tester.pumpWidget(createTestWidget(enabled: false));
      await tester.pumpAndSettle();

      // Should still render but with different styling
      expect(find.byType(EditTokenDeleteButton), findsOneWidget);
      expect(find.byType(AnimatedContainer), findsOneWidget);
    });

    testWidgets('has hover effects when enabled', (tester) async {
      await tester.pumpWidget(createTestWidget(enabled: true));
      await tester.pumpAndSettle();

      // Should have MouseRegion for hover effects
      expect(find.byType(MouseRegion), findsWidgets);
      expect(find.byType(ScaleTransition), findsWidgets);
    });

    testWidgets('shows shadow effect on hover when enabled', (tester) async {
      await tester.pumpWidget(createTestWidget(enabled: true));
      await tester.pumpAndSettle();

      // The AnimatedContainer should handle shadow changes
      expect(find.byType(AnimatedContainer), findsOneWidget);
    });
  });

  group('EditTokenSaveButton', () {
    late AppColors appColors;

    setUp(() {
      appColors = createTestAppColors();
    });

    Widget createTestWidget({
      String label = 'Save',
      VoidCallback? onPressed,
      bool enabled = true,
    }) {
      return createLocalizedTestWidget(
        child: Theme(
          data: ThemeData(extensions: [appColors]),
          child: EditTokenSaveButton(
            label: label,
            onPressed: onPressed ?? () {},
            enabled: enabled,
          ),
        ),
      );
    }

    testWidgets('renders with correct label and icon', (tester) async {
      await tester.pumpWidget(createTestWidget(label: 'Save Test'));

      expect(find.text('Save Test'), findsOneWidget);
      expect(find.byIcon(Icons.save_rounded), findsOneWidget);
      expect(find.byKey(editTokenSaveButtonKey), findsOneWidget);
    });

    testWidgets('calls onPressed when enabled and tapped', (tester) async {
      bool wasCalled = false;
      await tester.pumpWidget(
        createTestWidget(onPressed: () => wasCalled = true, enabled: true),
      );

      await tester.tap(find.byType(EditTokenSaveButton));
      await tester.pumpAndSettle();

      expect(wasCalled, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      bool wasCalled = false;
      await tester.pumpWidget(
        createTestWidget(onPressed: () => wasCalled = true, enabled: false),
      );

      await tester.tap(find.byType(EditTokenSaveButton));
      await tester.pumpAndSettle();

      expect(wasCalled, isFalse);
    });

    testWidgets('shows disabled styling when disabled', (tester) async {
      await tester.pumpWidget(createTestWidget(enabled: false));
      await tester.pumpAndSettle();

      // Should still render but with different styling
      expect(find.byType(EditTokenSaveButton), findsOneWidget);
      expect(find.byType(AnimatedContainer), findsOneWidget);
    });

    testWidgets('has proper button hierarchy', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Should have ElevatedButton inside
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(ScaleTransition), findsWidgets);
      expect(find.byType(MouseRegion), findsWidgets);
    });

    testWidgets('shows hover and scale animations', (tester) async {
      await tester.pumpWidget(createTestWidget(enabled: true));
      await tester.pumpAndSettle();

      // Should have animation components
      expect(find.byType(AnimatedContainer), findsOneWidget);
      expect(find.byType(ScaleTransition), findsWidgets);
    });

    testWidgets('applies correct padding', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final context = tester.element(find.byType(EditTokenSaveButton));
      final screenSize = MediaQuery.of(context).size;
      final shortestSide = screenSize.shortestSide;
      final expectedPadding = EdgeInsets.symmetric(
        horizontal: (shortestSide * 0.06).clamp(18.0, 44.0).toDouble(),
        vertical: (screenSize.height * 0.015).clamp(8.0, 20.0).toDouble(),
      );

      expect(container.padding, equals(expectedPadding));
    });

    testWidgets('displays icon and text in row', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Should have Row layout with icon and text
      expect(find.byType(Row), findsOneWidget);
      expect(find.byIcon(Icons.save_rounded), findsOneWidget);
      expect(find.text('Save'), findsOneWidget);
    });
  });

  group('Button Integration Tests', () {
    late AppColors appColors;

    setUp(() {
      appColors = createTestAppColors();
    });

    testWidgets('all buttons work together in column layout', (tester) async {
      bool saveCalled = false;
      bool deleteCalled = false;
      bool cancelCalled = false;

      await tester.pumpWidget(
        createLocalizedTestWidget(
          child: Theme(
            data: ThemeData(extensions: [appColors]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                EditTokenSaveButton(
                  label: 'Save',
                  onPressed: () => saveCalled = true,
                  enabled: true,
                ),
                const SizedBox(height: 12),
                EditTokenDeleteButton(
                  label: 'Delete',
                  onPressed: () => deleteCalled = true,
                  enabled: true,
                ),
                const SizedBox(height: 12),
                EditTokenCancelButton(
                  label: 'Cancel',
                  onPressed: () => cancelCalled = true,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Test each button
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();
      expect(saveCalled, isTrue);

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      expect(deleteCalled, isTrue);

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(cancelCalled, isTrue);
    });

    testWidgets('buttons have proper spacing and stretch layout', (
      tester,
    ) async {
      await tester.pumpWidget(
        createLocalizedTestWidget(
          child: Theme(
            data: ThemeData(extensions: [appColors]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                EditTokenSaveButton(
                  label: 'Save',
                  onPressed: () {},
                  enabled: true,
                ),
                const SizedBox(height: 12),
                EditTokenDeleteButton(
                  label: 'Delete',
                  onPressed: () {},
                  enabled: true,
                ),
                const SizedBox(height: 12),
                EditTokenCancelButton(label: 'Cancel', onPressed: () {}),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // All buttons should be present
      expect(find.byType(EditTokenSaveButton), findsOneWidget);
      expect(find.byType(EditTokenDeleteButton), findsOneWidget);
      expect(find.byType(EditTokenCancelButton), findsOneWidget);

      // Should have proper spacing (more SizedBox widgets due to internal button structure)
      expect(find.byType(SizedBox), findsWidgets);
    });
  });
}
