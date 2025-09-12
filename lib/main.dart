import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/app.dart';
import 'application/flavors.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  runApp(const App());
}
