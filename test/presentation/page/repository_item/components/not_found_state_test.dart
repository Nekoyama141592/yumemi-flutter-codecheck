import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/not_found_state.dart';
import 'test_helper.dart';

void main() {
  group('NotFoundState', () {
    late AppColors appColors;

    setUp(() {
      appColors = const AppColors(
        primary: Colors.blue,
        secondary: Colors.grey,
        accent: Colors.red,
        surface: Colors.white,
        cardBackground: Colors.grey,
        onSurface: Colors.black,
        border: Colors.grey,
        tokenOn: Colors.green,
        tokenOff: Colors.red,
      );
    });

    Widget createTestWidget() {
      return createLocalizedTestWidget(
        child: NotFoundState(appColors: appColors),
      );
    }

    testWidgets('renders correctly with basic properties', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byIcon(Icons.search_off_rounded), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('displays search icon with correct styling', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final iconFinder = find.byIcon(Icons.search_off_rounded);
      expect(iconFinder, findsOneWidget);

      final iconWidget = tester.widget<Icon>(iconFinder);
      expect(iconWidget.size, equals(48));
      expect(iconWidget.color, equals(appColors.secondary));
    });

    testWidgets('has correct container styling', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final containerFinder = find.byType(Container).first;
      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, equals(appColors.cardBackground));
      expect(decoration.borderRadius, equals(BorderRadius.circular(16)));
      expect(decoration.border, isA<Border>());
    });

    testWidgets('has correct layout structure', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);

      final columnFinder = find.byType(Column);
      final column = tester.widget<Column>(columnFinder);
      expect(column.children.length, greaterThan(1));
    });
  });
}
