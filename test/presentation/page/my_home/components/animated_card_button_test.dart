import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home/components/animated_card_button.dart';

void main() {
  group('AnimatedCardButton', () {
    Widget createTestWidget({
      VoidCallback? onTap,
      Widget? child,
      BorderRadius? borderRadius,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: AnimatedCardButton(
            onTap: onTap ?? () {},
            borderRadius: borderRadius ?? BorderRadius.circular(16),
            child: child ?? const Text('Test Button'),
          ),
        ),
      );
    }

    testWidgets('renders child widget correctly', (tester) async {
      await tester.pumpWidget(
        createTestWidget(child: const Text('Custom Button')),
      );

      expect(find.text('Custom Button'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(createTestWidget(onTap: () => tapped = true));

      await tester.tap(find.text('Test Button'));
      expect(tapped, isTrue);
    });

    testWidgets('contains necessary UI components', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(AnimatedCardButton), findsOneWidget);
      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(MouseRegion), findsWidgets);
      expect(find.byType(GestureDetector), findsWidgets);
      expect(find.byType(Material), findsWidgets);
      expect(find.byType(InkWell), findsWidgets);
      expect(find.byType(Transform), findsWidgets);
    });

    testWidgets('handles different border radius values', (tester) async {
      await tester.pumpWidget(
        createTestWidget(borderRadius: BorderRadius.circular(8)),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('responds to tap down and up events', (tester) async {
      bool tapCalled = false;
      await tester.pumpWidget(createTestWidget(onTap: () => tapCalled = true));

      // Perform a full tap
      await tester.tap(find.text('Test Button'));
      await tester.pumpAndSettle();

      expect(tapCalled, isTrue);
    });

    testWidgets('handles tap cancel properly', (tester) async {
      bool tapCalled = false;
      await tester.pumpWidget(createTestWidget(onTap: () => tapCalled = true));

      // Start a gesture but don't complete it
      final gesture = await tester.startGesture(
        tester.getCenter(find.text('Test Button')),
      );

      await tester.pump();

      // Move away to trigger cancel
      await gesture.moveBy(const Offset(100, 100));
      await tester.pump();

      // Clean up
      await gesture.up();
      await tester.pumpAndSettle();

      // The tap should not have been called due to cancel
      expect(tapCalled, isFalse);
    });
  });
}
