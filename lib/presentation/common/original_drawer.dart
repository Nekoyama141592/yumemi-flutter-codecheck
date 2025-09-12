import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../notifier/theme/theme_notifier.dart';

class OriginalDrawer extends ConsumerWidget {
  const OriginalDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);

    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Text('Settings'),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
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