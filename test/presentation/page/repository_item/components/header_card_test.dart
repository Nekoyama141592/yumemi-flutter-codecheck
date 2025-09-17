import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/components/header_card.dart';
import 'test_helper.dart';

void main() {
  group('HeaderCard', () {
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

    Widget createTestWidget({required GetRepositoryItemEntity repo}) {
      return createLocalizedTestWidget(
        child: HeaderCard(repo: repo, appColors: appColors),
      );
    }

    testWidgets('renders correctly with basic properties', (tester) async {
      final repo = const GetRepositoryItemEntity(
        fullName: 'test/repo',
        language: 'Dart',
        stargazersCount: 100,
        watchersCount: 50,
        forksCount: 25,
        openIssuesCount: 5,
        ownerAvatarUrl: 'https://example.com/avatar.png',
        htmlUrl: 'https://github.com/test/repo',
      );

      await tester.pumpWidget(createTestWidget(repo: repo));

      expect(find.text('test/repo'), findsOneWidget);
      expect(find.text('Dart'), findsOneWidget);
    });

    testWidgets('shows default avatar when avatarUrl is null', (tester) async {
      final repo = const GetRepositoryItemEntity(
        fullName: 'test/repo',
        language: 'Dart',
        stargazersCount: 100,
        watchersCount: 50,
        forksCount: 25,
        openIssuesCount: 5,
        ownerAvatarUrl: null,
        htmlUrl: 'https://github.com/test/repo',
      );

      await tester.pumpWidget(createTestWidget(repo: repo));

      expect(find.byIcon(Icons.account_circle_rounded), findsOneWidget);
      expect(find.text('test/repo'), findsOneWidget);
    });

    testWidgets('shows default avatar when avatarUrl is empty', (tester) async {
      final repo = const GetRepositoryItemEntity(
        fullName: 'test/repo',
        language: 'Dart',
        stargazersCount: 100,
        watchersCount: 50,
        forksCount: 25,
        openIssuesCount: 5,
        ownerAvatarUrl: '',
        htmlUrl: 'https://github.com/test/repo',
      );

      await tester.pumpWidget(createTestWidget(repo: repo));

      expect(find.byIcon(Icons.account_circle_rounded), findsOneWidget);
      expect(find.text('test/repo'), findsOneWidget);
    });

    testWidgets('does not show language badge when language is null', (
      tester,
    ) async {
      final repo = const GetRepositoryItemEntity(
        fullName: 'test/repo',
        language: null,
        stargazersCount: 100,
        watchersCount: 50,
        forksCount: 25,
        openIssuesCount: 5,
        ownerAvatarUrl: null,
        htmlUrl: 'https://github.com/test/repo',
      );

      await tester.pumpWidget(createTestWidget(repo: repo));

      expect(find.text('test/repo'), findsOneWidget);
      expect(find.byIcon(Icons.account_circle_rounded), findsOneWidget);
      // Language text should not be found
      expect(find.text('Dart'), findsNothing);
    });

    testWidgets('has correct container styling', (tester) async {
      final repo = const GetRepositoryItemEntity(
        fullName: 'test/repo',
        language: 'Dart',
        stargazersCount: 100,
        watchersCount: 50,
        forksCount: 25,
        openIssuesCount: 5,
        ownerAvatarUrl: null,
        htmlUrl: 'https://github.com/test/repo',
      );

      await tester.pumpWidget(createTestWidget(repo: repo));

      final containerFinder = find.byType(Container).first;
      final containerWidget = tester.widget<Container>(containerFinder);
      final decoration = containerWidget.decoration as BoxDecoration;

      expect(decoration.color, equals(appColors.cardBackground));
      expect(decoration.borderRadius, equals(BorderRadius.circular(16)));
    });
  });
}
