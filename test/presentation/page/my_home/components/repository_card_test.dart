import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home/components/repository_card.dart';

void main() {
  group('RepositoryCard', () {
    late AppColors appColors;
    late SearchRepositoriesItemEntity mockRepo;

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

      mockRepo = const SearchRepositoriesItemEntity(
        fullName: 'flutter/flutter',
        name: 'flutter',
      );
    });

    Widget createTestWidget({VoidCallback? onTap}) {
      return MaterialApp(
        home: Scaffold(
          body: RepositoryCard(
            appColors: appColors,
            repo: mockRepo,
            onTap: onTap ?? () {},
          ),
        ),
      );
    }

    testWidgets('renders repository name correctly', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('flutter/flutter'), findsOneWidget);
    });

    testWidgets('displays forward arrow icon', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byIcon(Icons.arrow_forward_ios_rounded), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(createTestWidget(onTap: () => tapped = true));

      await tester.tap(find.byType(RepositoryCard));
      expect(tapped, isTrue);
    });

    testWidgets('has correct container styling', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('displays text with correct overflow behavior', (tester) async {
      final longNameRepo = const SearchRepositoriesItemEntity(
        fullName:
            'very-long-repository-name/very-long-repository-name-that-might-overflow',
        name: 'very-long-repository-name-that-might-overflow',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RepositoryCard(
              appColors: appColors,
              repo: longNameRepo,
              onTap: () {},
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text(longNameRepo.fullName));
      expect(text.overflow, equals(TextOverflow.ellipsis));
    });
  });
}
