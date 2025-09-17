import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/stats_grid.dart';
import 'test_helper.dart';

void main() {
  group('StatsGrid', () {
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

      mockRepo = const GetRepositoryItemEntity(
        fullName: 'test/repo',
        language: 'Dart',
        stargazersCount: 1500,
        watchersCount: 200,
        forksCount: 50,
        openIssuesCount: 10,
        ownerAvatarUrl: null,
        htmlUrl: 'https://github.com/test/repo',
      );
    });

    Widget createTestWidget({
      required GetRepositoryItemEntity repo,
      bool isLandscape = false,
    }) {
      return createLocalizedTestWidget(
        child: StatsGrid(
          repo: repo,
          appColors: appColors,
          isLandscape: isLandscape,
        ),
      );
    }

    testWidgets('renders correctly with basic properties', (tester) async {
      await tester.pumpWidget(createTestWidget(repo: mockRepo));

      expect(find.text('1.5k'), findsOneWidget); // stars
      expect(find.text('200'), findsOneWidget); // watchers
      expect(find.text('50'), findsOneWidget); // forks
      expect(find.text('10'), findsOneWidget); // issues
      expect(find.byIcon(Icons.star_rounded), findsOneWidget);
      expect(find.byIcon(Icons.visibility_rounded), findsOneWidget);
      expect(find.byIcon(Icons.fork_right_rounded), findsOneWidget);
      expect(find.byIcon(Icons.bug_report_rounded), findsOneWidget);
    });

    testWidgets('formats large numbers correctly', (tester) async {
      final largeNumberRepo = const GetRepositoryItemEntity(
        fullName: 'test/repo',
        language: 'Dart',
        stargazersCount: 1500000, // 1.5M
        watchersCount: 2500, // 2.5k
        forksCount: 999, // 999 (no formatting)
        openIssuesCount: 10000, // 10.0k
        ownerAvatarUrl: null,
        htmlUrl: 'https://github.com/test/repo',
      );

      await tester.pumpWidget(createTestWidget(repo: largeNumberRepo));

      expect(find.text('1.5M'), findsOneWidget);
      expect(find.text('2.5k'), findsOneWidget);
      expect(find.text('999'), findsOneWidget);
      expect(find.text('10.0k'), findsOneWidget);
    });

    testWidgets('renders correctly in landscape mode', (tester) async {
      await tester.pumpWidget(
        createTestWidget(repo: mockRepo, isLandscape: true),
      );

      // Text values should be there
      expect(find.text('1.5k'), findsOneWidget);
      expect(find.text('200'), findsOneWidget);
      expect(find.text('50'), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('renders correctly in portrait mode', (tester) async {
      await tester.pumpWidget(
        createTestWidget(repo: mockRepo, isLandscape: false),
      );

      // Should have the basic grid structure
      expect(find.byType(GridView), findsOneWidget);
      expect(find.text('1.5k'), findsOneWidget);
      expect(find.text('200'), findsOneWidget);
    });
  });
}
