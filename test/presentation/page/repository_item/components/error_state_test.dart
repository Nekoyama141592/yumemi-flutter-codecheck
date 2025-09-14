import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/error_state.dart';
import 'test_helper.dart';

void main() {
  group('ErrorState', () {
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
      return createLocalizedTestWidget(child: ErrorState(appColors: appColors));
    }

    testWidgets('renders correctly with basic properties', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byIcon(Icons.error_outline_rounded), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('displays error icon with correct styling', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final iconFinder = find.byIcon(Icons.error_outline_rounded);
      expect(iconFinder, findsOneWidget);

      final iconWidget = tester.widget<Icon>(iconFinder);
      expect(iconWidget.size, equals(48));
      expect(iconWidget.color, equals(appColors.accent));
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
  });
}
