import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/header_card_loading.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/shimmer_components.dart';

void main() {
  group('HeaderCardLoading', () {
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
        dialogBackground: Colors.white,
        dialogBorder: Colors.grey,
        inputBackground: Colors.white,
        inputBorder: Colors.grey,
        inputFocusedBorder: Colors.blue,
        buttonSuccess: Colors.green,
        buttonDanger: Colors.red,
        buttonSecondary: Colors.grey,
        shadow: Colors.black,
      );
    });

    Widget createTestWidget() {
      return MaterialApp(
        home: Scaffold(body: HeaderCardLoading(appColors: appColors)),
      );
    }

    testWidgets('renders correctly with basic properties', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(ShimmerCircle), findsOneWidget);
      expect(find.byType(ShimmerContainer), findsNWidgets(2));
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('has correct shimmer components', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final shimmerCircle = tester.widget<ShimmerCircle>(
        find.byType(ShimmerCircle),
      );
      expect(shimmerCircle.radius, greaterThan(0));

      final shimmerContainers = tester.widgetList<ShimmerContainer>(
        find.byType(ShimmerContainer),
      );
      expect(shimmerContainers.length, equals(2));

      // Check title shimmer container
      final titleContainer = shimmerContainers.first;
      expect(titleContainer.height, greaterThan(0));
      expect(titleContainer.width, greaterThan(0));

      // Check chip shimmer container
      final chipContainer = shimmerContainers.last;
      expect(chipContainer.height, greaterThan(0));
      expect(chipContainer.width, greaterThan(0));
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

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.children.length, greaterThan(3));
    });

    testWidgets('shimmer containers have correct border radius', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final shimmerContainers = tester.widgetList<ShimmerContainer>(
        find.byType(ShimmerContainer),
      );

      // Title container should have smaller border radius
      expect(
        shimmerContainers.first.borderRadius,
        equals(const BorderRadius.all(Radius.circular(6))),
      );

      // Chip container should have larger border radius
      expect(
        shimmerContainers.last.borderRadius,
        equals(const BorderRadius.all(Radius.circular(20))),
      );
    });
  });
}
