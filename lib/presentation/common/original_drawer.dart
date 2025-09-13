import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../notifier/keep_alive/theme/theme_notifier.dart';
import '../../l10n/app_localizations.dart';

class OriginalDrawer extends ConsumerWidget {
  const OriginalDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text(AppLocalizations.of(context)!.settings)),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: Text(AppLocalizations.of(context)!.darkMode),
            trailing: CupertinoSwitch(
              value: themeState.isDarkMode,
              onChanged: (value) => themeNotifier.toggleTheme(),
            ),
          ),
        ],
      ),
    );
  }
}
