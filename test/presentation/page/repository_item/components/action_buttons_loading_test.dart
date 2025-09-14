import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/loading_state.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/header_card_loading.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/stats_grid_loading.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/action_buttons_loading.dart';

void main() {
  group('LoadingState', () {
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

    Widget createTestWidget({bool isLandscape = false}) {
      return MaterialApp(
        home: Scaffold(
          body: LoadingState(appColors: appColors, isLandscape: isLandscape),
        ),
      );
    }

    testWidgets('renders correctly in portrait mode', (tester) async {
      await tester.pumpWidget(createTestWidget(isLandscape: false));

      expect(find.byType(HeaderCardLoading), findsOneWidget);
      expect(find.byType(StatsGridLoading), findsOneWidget);
      expect(find.byType(ActionButtonsLoading), findsOneWidget);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Row), findsNothing);
    });

    testWidgets('renders correctly in landscape mode', (tester) async {
      await tester.pumpWidget(createTestWidget(isLandscape: true));

      expect(find.byType(HeaderCardLoading), findsOneWidget);
      expect(find.byType(StatsGridLoading), findsOneWidget);
      expect(find.byType(ActionButtonsLoading), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('has correct layout structure for portrait', (tester) async {
      await tester.pumpWidget(createTestWidget(isLandscape: false));

      final columnFinder = find.byType(Column);
      expect(columnFinder, findsWidgets);

      // Should have main column with components in vertical layout
      final mainColumn = tester.widget<Column>(columnFinder.first);
      expect(mainColumn.crossAxisAlignment, equals(CrossAxisAlignment.start));
    });

    testWidgets('has correct layout structure for landscape', (tester) async {
      await tester.pumpWidget(createTestWidget(isLandscape: true));

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Expanded), findsNWidgets(2));

      final rowFinder = find.byType(Row);
      final row = tester.widget<Row>(rowFinder);
      expect(row.crossAxisAlignment, equals(CrossAxisAlignment.start));
    });
  });
}
