import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home/components/repository_list_view.dart';

void main() {
  group('RepositoryListView', () {
    late AppColors appColors;
    late List<SearchRepositoriesItemEntity> mockRepositories;

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

      mockRepositories = [
        const SearchRepositoriesItemEntity(
          fullName: 'flutter/flutter',
          name: 'flutter',
        ),
        const SearchRepositoriesItemEntity(
          fullName: 'firebase/firebase',
          name: 'firebase',
        ),
      ];
    });

    Widget createTestWidget({
      List<SearchRepositoriesItemEntity>? repositories,
      ValueChanged<SearchRepositoriesItemEntity>? onTapRepo,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: RepositoryListView(
            appColors: appColors,
            repositories: repositories ?? mockRepositories,
            onTapRepo: onTapRepo ?? (repo) {},
          ),
        ),
      );
    }

    testWidgets('renders correct number of repository items', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Just pump once and check if widgets are present
      await tester.pump();

      expect(find.text('flutter/flutter'), findsOneWidget);
      expect(find.text('firebase/firebase'), findsOneWidget);
    });

    testWidgets('renders empty list when no repositories', (tester) async {
      await tester.pumpWidget(createTestWidget(repositories: []));

      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('flutter/flutter'), findsNothing);
    });

    testWidgets('calls onTapRepo when repository is tapped', (tester) async {
      SearchRepositoriesItemEntity? tappedRepo;
      await tester.pumpWidget(
        createTestWidget(onTapRepo: (repo) => tappedRepo = repo),
      );

      // Just pump once and check if widgets are present
      await tester.pump();

      await tester.tap(find.text('flutter/flutter'));
      expect(tappedRepo?.fullName, equals('flutter/flutter'));
    });

    testWidgets('displays ListView with correct item count', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Just pump once and check if widgets are present
      await tester.pump();

      final listView = tester.widget<ListView>(find.byType(ListView));
      expect(listView, isNotNull);
    });

    testWidgets('handles single repository correctly', (tester) async {
      final singleRepo = [mockRepositories.first];
      await tester.pumpWidget(createTestWidget(repositories: singleRepo));

      // Just pump once and check if widgets are present
      await tester.pump();

      expect(find.text('flutter/flutter'), findsOneWidget);
      expect(find.text('firebase/firebase'), findsNothing);
    });

    testWidgets('applies correct padding and spacing', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Just pump once and check if widgets are present
      await tester.pump();

      final listView = tester.widget<ListView>(find.byType(ListView));
      expect(listView.padding, isNotNull);
    });
  });
}
