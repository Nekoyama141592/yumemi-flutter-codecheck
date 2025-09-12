import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../application/flavors.dart';
import 'common/original_drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(F.title)),
      drawer: const OriginalDrawer(),
      body: Center(child: Text(AppLocalizations.of(context)!.hello)),
    );
  }
}
