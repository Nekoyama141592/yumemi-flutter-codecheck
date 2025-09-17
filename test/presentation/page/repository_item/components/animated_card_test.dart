import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/animated_card.dart';

void main() {
  group('AnimatedCard', () {
    Widget createTestWidget({
      required Widget child,
      Duration delay = Duration.zero,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: AnimatedCard(delay: delay, child: child),
        ),
      );
    }

    testWidgets('renders correctly with child widget', (tester) async {
      const childWidget = Text('Test Card');

      await tester.pumpWidget(createTestWidget(child: childWidget));

      expect(find.text('Test Card'), findsOneWidget);
      expect(find.byType(SlideTransition), findsOneWidget);
      expect(find.byType(FadeTransition), findsOneWidget);
    });

    testWidgets('starts animation after delay', (tester) async {
      const childWidget = Text('Test Card');
      const delay = Duration(milliseconds: 100);

      await tester.pumpWidget(
        createTestWidget(child: childWidget, delay: delay),
      );

      // Initially, the widget should not be fully visible
      final fadeTransitionFinder = find.byType(FadeTransition);
      expect(fadeTransitionFinder, findsOneWidget);

      final initialOpacity = tester
          .widget<FadeTransition>(fadeTransitionFinder)
          .opacity
          .value;
      expect(initialOpacity, equals(0.0));

      // Wait for the delay and animation to complete
      await tester.pump(delay);
      await tester.pumpAndSettle();

      // Now it should be fully visible
      final finalOpacity = tester
          .widget<FadeTransition>(fadeTransitionFinder)
          .opacity
          .value;
      expect(finalOpacity, equals(1.0));
    });

    testWidgets('has slide transition with correct offset', (tester) async {
      const childWidget = Text('Test Card');

      await tester.pumpWidget(createTestWidget(child: childWidget));

      final slideTransitionFinder = find.byType(SlideTransition);
      expect(slideTransitionFinder, findsOneWidget);

      // Initially should have an offset
      final initialOffset = tester
          .widget<SlideTransition>(slideTransitionFinder)
          .position
          .value;
      expect(initialOffset.dy, greaterThan(0.0));

      // After animation completes, should be at zero offset
      await tester.pumpAndSettle();
      final finalOffset = tester
          .widget<SlideTransition>(slideTransitionFinder)
          .position
          .value;
      expect(finalOffset, equals(Offset.zero));
    });

    testWidgets('completes fade animation', (tester) async {
      const childWidget = Text('Test Card');

      await tester.pumpWidget(createTestWidget(child: childWidget));

      // Let animation complete
      await tester.pumpAndSettle();

      final fadeTransitionFinder = find.byType(FadeTransition);
      final finalOpacity = tester
          .widget<FadeTransition>(fadeTransitionFinder)
          .opacity
          .value;
      expect(finalOpacity, equals(1.0));
    });
  });
}
