import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/repository_content.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/animated_card.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/header_card.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/stats_grid.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/action_buttons.dart';

void main() {
  group('RepositoryContent', () {
    late AppColors appColors;
    late GetRepositoryItemEntity mockRepo;

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

      mockRepo = const GetRepositoryItemEntity(
        fullName: 'test/repo',
        language: 'Dart',
        stargazersCount: 100,
        watchersCount: 50,
        forksCount: 25,
        openIssuesCount: 5,
        ownerAvatarUrl: null,
        htmlUrl: 'https://github.com/test/repo',
      );
    });

    Widget createTestWidget({
      bool isLandscape = false,
      Future<void> Function(String?)? onLaunchUrl,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: RepositoryContent(
            repo: mockRepo,
            appColors: appColors,
            isLandscape: isLandscape,
            onLaunchUrl: onLaunchUrl ?? (_) async {},
          ),
        ),
      );
    }

    testWidgets('renders correctly in portrait mode', (tester) async {
      await tester.pumpWidget(createTestWidget(isLandscape: false));

      expect(find.byType(AnimatedCard), findsNWidgets(3));
      expect(find.byType(HeaderCard), findsOneWidget);
      expect(find.byType(StatsGrid), findsOneWidget);
      expect(find.byType(ActionButtons), findsOneWidget);
      expect(find.byType(Row), findsNothing);
    });

    testWidgets('renders correctly in landscape mode', (tester) async {
      await tester.pumpWidget(createTestWidget(isLandscape: true));

      expect(find.byType(AnimatedCard), findsNWidgets(3));
      expect(find.byType(HeaderCard), findsOneWidget);
      expect(find.byType(StatsGrid), findsOneWidget);
      expect(find.byType(ActionButtons), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Expanded), findsNWidgets(2));
    });

    testWidgets('has correct layout structure for portrait', (tester) async {
      await tester.pumpWidget(createTestWidget(isLandscape: false));

      final columnFinder = find.byType(Column);
      expect(columnFinder, findsWidgets);

      final mainColumn = tester.widget<Column>(columnFinder.first);
      expect(mainColumn.crossAxisAlignment, equals(CrossAxisAlignment.start));
    });

    testWidgets('has correct layout structure for landscape', (tester) async {
      await tester.pumpWidget(createTestWidget(isLandscape: true));

      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);

      final row = tester.widget<Row>(rowFinder);
      expect(row.crossAxisAlignment, equals(CrossAxisAlignment.start));
      expect(
        row.children.length,
        equals(3),
      ); // Two Expanded widgets and one SizedBox
    });

    testWidgets('passes correct props to child widgets', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final headerCard = tester.widget<HeaderCard>(find.byType(HeaderCard));
      expect(headerCard.repo, equals(mockRepo));
      expect(headerCard.appColors, equals(appColors));

      final statsGrid = tester.widget<StatsGrid>(find.byType(StatsGrid));
      expect(statsGrid.repo, equals(mockRepo));
      expect(statsGrid.appColors, equals(appColors));

      final actionButtons = tester.widget<ActionButtons>(
        find.byType(ActionButtons),
      );
      expect(actionButtons.repo, equals(mockRepo));
      expect(actionButtons.appColors, equals(appColors));
    });

    testWidgets('animated cards have different delays', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final animatedCards = tester.widgetList<AnimatedCard>(
        find.byType(AnimatedCard),
      );
      final delays = animatedCards.map((card) => card.delay).toList();

      expect(delays.length, equals(3));
      expect(delays[0], equals(const Duration(milliseconds: 200)));
      expect(delays[1], equals(const Duration(milliseconds: 400)));
      expect(delays[2], equals(const Duration(milliseconds: 600)));
    });
  });
}
