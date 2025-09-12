import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumemi_flutter_codecheck/core/provider/overrides/prefs/prefs_provider.dart';

import 'application/app.dart';
import 'application/flavors.dart';

void main() async {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  runApp(ProviderScope(overrides: [
    prefsProvider.overrideWithValue(
      await SharedPreferences.getInstance(),
    ),
  ],child: const App()));
}
