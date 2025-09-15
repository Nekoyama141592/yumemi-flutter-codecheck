import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home/components/animated_list_item.dart';

void main() {
  group('AnimatedListItem', () {
    testWidgets('renders child widget correctly', (tester) async {
      const testChild = Text('Custom Child');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AnimatedListItem(index: 0, child: testChild)),
        ),
      );

      // Just pump once and check if widget is present
      await tester.pump();

      expect(find.text('Custom Child'), findsOneWidget);
    });

    testWidgets('accepts different index values', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedListItem(index: 5, child: Text('Test Child')),
          ),
        ),
      );

      // Just pump once and check if widget is present
      await tester.pump();

      expect(find.text('Test Child'), findsOneWidget);
      expect(find.byType(AnimatedListItem), findsOneWidget);
    });

    testWidgets('renders with complex child widgets', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedListItem(
              index: 1,
              child: Container(
                width: 100,
                height: 50,
                color: Colors.blue,
                child: const Text('Container Child'),
              ),
            ),
          ),
        ),
      );

      // Just pump once and check if widget is present
      await tester.pump();

      expect(find.text('Container Child'), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });
  });
}
