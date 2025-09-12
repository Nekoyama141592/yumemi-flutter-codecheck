import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../application/flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(F.title)),
      body: Center(child: Text(AppLocalizations.of(context)!.hello)),
    );
  }
}
