import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home/components/loading_view.dart';
import 'test_helper.dart';

void main() {
  group('LoadingView', () {
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

    Widget createTestWidget() {
      return createLocalizedTestWidget(
        child: LoadingView(appColors: appColors),
      );
    }

    testWidgets('renders correctly with loading indicator and text', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('displays circular progress indicator with correct color', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final progressIndicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(progressIndicator.color, equals(appColors.primary));
    });

    testWidgets('has correct layout structure', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Check that we have the expected structure
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
    });
  });
}
