import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home/components/empty_view.dart';
import '../../../helpers/widget_test_helpers.dart';

void main() {
  group('EmptyView', () {
    late AppColors appColors;

    setUp(() {
      appColors = createTestAppColors();
    });

    Widget createTestWidget() {
      return createLocalizedTestWidget(child: EmptyView(appColors: appColors));
    }

    testWidgets('renders correctly with search icon and container', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('displays search icon with correct color', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final icon = tester.widget<Icon>(find.byIcon(Icons.search_rounded));
      expect(icon.color, equals(appColors.primary));
    });

    testWidgets('has correct layout structure', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Check that we have the expected structure
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('displays search icon', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    });
  });
}
