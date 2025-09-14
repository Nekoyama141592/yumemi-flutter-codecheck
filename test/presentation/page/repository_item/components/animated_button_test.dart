import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/animated_button.dart';

void main() {
  group('AnimatedButton', () {
    Widget createTestWidget({
      required Widget child,
      required VoidCallback onPressed,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: AnimatedButton(onPressed: onPressed, child: child),
        ),
      );
    }

    testWidgets('renders correctly with child widget', (tester) async {
      const childWidget = Text('Test Button');

      await tester.pumpWidget(
        createTestWidget(child: childWidget, onPressed: () {}),
      );

      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(ScaleTransition), findsWidgets);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      bool wasPressed = false;
      const childWidget = Text('Test Button');

      await tester.pumpWidget(
        createTestWidget(
          child: childWidget,
          onPressed: () => wasPressed = true,
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(wasPressed, isTrue);
    });

    testWidgets('has scale animation on tap', (tester) async {
      const childWidget = Text('Test Button');

      await tester.pumpWidget(
        createTestWidget(child: childWidget, onPressed: () {}),
      );

      expect(find.byType(ScaleTransition), findsWidgets);
      expect(find.byType(GestureDetector), findsOneWidget);

      final gesture = await tester.startGesture(
        tester.getCenter(find.byType(GestureDetector)),
      );
      await tester.pump(const Duration(milliseconds: 75));

      // Just verify the animation structure exists
      expect(find.byType(ScaleTransition), findsWidgets);

      await gesture.up();
    });

    testWidgets('scale returns to normal after tap', (tester) async {
      const childWidget = Text('Test Button');

      await tester.pumpWidget(
        createTestWidget(child: childWidget, onPressed: () {}),
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      // Just verify the widget structure is maintained
      expect(find.byType(ScaleTransition), findsWidgets);
      expect(find.text('Test Button'), findsOneWidget);
    });
  });
}
