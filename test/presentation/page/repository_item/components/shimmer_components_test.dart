import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/stats_grid_loading.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/shimmer_components.dart';

void main() {
  group('StatsGridLoading', () {
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
        home: Scaffold(body: StatsGridLoading(appColors: appColors)),
      );
    }

    testWidgets('renders correctly with basic properties', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(LayoutBuilder), findsOneWidget);
      expect(find.byType(ShimmerCircle), findsNWidgets(4)); // 4 stat items
      expect(
        find.byType(ShimmerContainer),
        findsNWidgets(8),
      ); // 2 containers per item * 4 items
    });

    testWidgets('creates 4 loading items', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Should have 4 loading items (stars, watchers, forks, issues)
      expect(find.byType(ShimmerCircle), findsNWidgets(4));
      expect(find.byType(ShimmerContainer), findsNWidgets(8)); // 2 per item
    });

    testWidgets('has correct grid layout', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final gridView = tester.widget<GridView>(find.byType(GridView));
      expect(gridView.shrinkWrap, isTrue);
      expect(gridView.physics, isA<NeverScrollableScrollPhysics>());

      final delegate =
          gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, greaterThan(0));
      expect(delegate.crossAxisCount, lessThanOrEqualTo(4));
    });

    testWidgets('has correct container styling for each item', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final containers = tester
          .widgetList<Container>(find.byType(Container))
          .where((container) {
            final decoration = container.decoration;
            return decoration is BoxDecoration &&
                decoration.color == appColors.cardBackground;
          });

      expect(containers.length, equals(4));

      for (final container in containers) {
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, equals(appColors.cardBackground));
        expect(decoration.borderRadius, equals(BorderRadius.circular(16)));
        expect(decoration.border, isA<Border>());
      }
    });

    testWidgets('each item has correct shimmer components', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Each item should have one circle and two containers
      final circles = tester.widgetList<ShimmerCircle>(
        find.byType(ShimmerCircle),
      );
      final containers = tester.widgetList<ShimmerContainer>(
        find.byType(ShimmerContainer),
      );

      expect(circles.length, equals(4));
      expect(containers.length, equals(8));

      // Each circle should have correct radius
      for (final circle in circles) {
        expect(circle.radius, greaterThan(0));
      }

      // Each container should have correct dimensions
      for (final container in containers) {
        expect(container.height, greaterThan(0));
        expect(container.width, greaterThan(0));
      }
    });

    testWidgets('has correct column layout for each item', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final columns = tester.widgetList<Column>(find.byType(Column)).where((
        column,
      ) {
        return column.mainAxisAlignment == MainAxisAlignment.center;
      });

      expect(columns.length, equals(4));

      for (final column in columns) {
        expect(column.mainAxisAlignment, equals(MainAxisAlignment.center));
        expect(
          column.children.length,
          equals(5),
        ); // Circle, SizedBox, Container, SizedBox, Container
      }
    });
  });
}
