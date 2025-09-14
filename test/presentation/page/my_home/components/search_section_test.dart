import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home/components/search_section.dart';
import 'test_helper.dart';

void main() {
  group('SearchSection', () {
    late AppColors appColors;
    late TextEditingController searchController;

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
      searchController = TextEditingController();
    });

    tearDown(() {
      searchController.dispose();
    });

    Widget createTestWidget({
      Future<void> Function(String query)? onQueryChanged,
      Future<void> Function()? onClear,
    }) {
      return createLocalizedTestWidget(
        child: SearchSection(
          appColors: appColors,
          searchController: searchController,
          onQueryChanged: onQueryChanged ?? (query) async {},
          onClear: onClear ?? () async {},
        ),
      );
    }

    testWidgets('renders correctly with search field and icon', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    });

    testWidgets('calls onQueryChanged when text is entered', (tester) async {
      String? changedQuery;
      await tester.pumpWidget(
        createTestWidget(onQueryChanged: (query) async => changedQuery = query),
      );

      await tester.enterText(find.byType(TextFormField), 'flutter');
      expect(changedQuery, equals('flutter'));
    });

    testWidgets('shows clear button when text is present', (tester) async {
      searchController.text = 'flutter';
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.clear_rounded), findsOneWidget);
    });

    testWidgets('hides clear button when text is empty', (tester) async {
      searchController.text = '';
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.clear_rounded), findsNothing);
    });

    testWidgets('calls onClear when clear button is tapped', (tester) async {
      bool clearCalled = false;
      searchController.text = 'flutter';

      await tester.pumpWidget(
        createTestWidget(onClear: () async => clearCalled = true),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.clear_rounded));
      expect(clearCalled, isTrue);
    });

    testWidgets('displays search field with correct styling', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final textField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      expect(textField.controller, equals(searchController));
    });
  });
}
