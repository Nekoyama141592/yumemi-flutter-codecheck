import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/application/theme/dark_theme.dart';
import 'package:yumemi_flutter_codecheck/application/theme/light_theme.dart';
import 'package:yumemi_flutter_codecheck/core/provider/keep_alive/app_router/app_router_provider.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/keep_alive/theme/theme_notifier.dart';
import '../l10n/app_localizations.dart';

import 'flavors.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      title: F.title,
      theme: themeState.isDarkMode ? darkTheme : lightTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ja'), Locale('zh')],
    );
  }
}
