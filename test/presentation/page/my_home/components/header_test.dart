import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home/components/header.dart';
import 'test_helper.dart';

void main() {
  group('Header', () {
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

    Widget createTestWidget({
      bool isDark = false,
      String? token,
      VoidCallback? onToggleTheme,
      VoidCallback? onEditToken,
    }) {
      return createLocalizedTestWidget(
        child: Header(
          isDark: isDark,
          token: token,
          appColors: appColors,
          onToggleTheme: onToggleTheme ?? () {},
          onEditToken: onEditToken ?? () {},
        ),
      );
    }

    testWidgets('renders correctly with basic properties', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.text('GitHub'), findsOneWidget);
      expect(find.byIcon(Icons.dark_mode_rounded), findsOneWidget);
      expect(find.byIcon(Icons.vpn_key_rounded), findsOneWidget);
    });

    testWidgets('displays light mode icon when isDark is false', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget(isDark: false));

      expect(find.byIcon(Icons.dark_mode_rounded), findsOneWidget);
      expect(find.byIcon(Icons.light_mode_rounded), findsNothing);
    });

    testWidgets('displays dark mode icon when isDark is true', (tester) async {
      await tester.pumpWidget(createTestWidget(isDark: true));

      expect(find.byIcon(Icons.light_mode_rounded), findsOneWidget);
      expect(find.byIcon(Icons.dark_mode_rounded), findsNothing);
    });

    testWidgets('calls onToggleTheme when theme button is tapped', (
      tester,
    ) async {
      bool called = false;
      await tester.pumpWidget(
        createTestWidget(onToggleTheme: () => called = true),
      );

      await tester.tap(find.byIcon(Icons.dark_mode_rounded));
      expect(called, isTrue);
    });

    testWidgets('calls onEditToken when token button is tapped', (
      tester,
    ) async {
      bool called = false;
      await tester.pumpWidget(
        createTestWidget(onEditToken: () => called = true),
      );

      await tester.tap(find.byIcon(Icons.vpn_key_rounded));
      expect(called, isTrue);
    });

    testWidgets(
      'displays token button with different colors based on token presence',
      (tester) async {
        // Test without token
        await tester.pumpWidget(createTestWidget(token: null));
        await tester.pumpAndSettle();

        // Test with token
        await tester.pumpWidget(createTestWidget(token: 'test-token'));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.vpn_key_rounded), findsOneWidget);
      },
    );
  });
}
