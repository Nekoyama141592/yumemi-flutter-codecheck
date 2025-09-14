import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home/components/error_view.dart';
import 'test_helper.dart';

void main() {
  group('ErrorView', () {
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

    Widget createTestWidget({Object error = 'Test Error'}) {
      return createLocalizedTestWidget(
        child: ErrorView(appColors: appColors, error: error),
      );
    }

    testWidgets('renders correctly with error icon and container', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byIcon(Icons.error_outline_rounded), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('displays error icon with correct color', (tester) async {
      await tester.pumpWidget(createTestWidget());

      final icon = tester.widget<Icon>(
        find.byIcon(Icons.error_outline_rounded),
      );
      expect(icon.color, equals(appColors.accent));
    });

    testWidgets('has correct layout structure', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Check that we have the expected structure
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('handles different error types', (tester) async {
      await tester.pumpWidget(createTestWidget(error: 'String Error'));
      expect(find.byType(ErrorView), findsOneWidget);

      await tester.pumpWidget(
        createTestWidget(error: Exception('Exception Error')),
      );
      expect(find.byType(ErrorView), findsOneWidget);
    });
  });
}
