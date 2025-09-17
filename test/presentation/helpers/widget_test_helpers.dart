import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/l10n/app_localizations.dart';

const AppColors _defaultAppColors = AppColors(
  primary: Colors.blue,
  secondary: Colors.grey,
  accent: Colors.red,
  surface: Colors.white,
  cardBackground: Colors.grey,
  onSurface: Colors.black,
  border: Colors.grey,
  tokenOn: Colors.green,
  tokenOff: Colors.red,
  dialogBackground: Colors.white,
  dialogBorder: Colors.grey,
  inputBackground: Colors.white,
  inputBorder: Colors.grey,
  inputFocusedBorder: Colors.blue,
  buttonSuccess: Colors.green,
  buttonDanger: Colors.red,
  buttonSecondary: Colors.grey,
  shadow: Colors.black,
);

AppColors createTestAppColors({
  Color? primary,
  Color? secondary,
  Color? accent,
  Color? surface,
  Color? cardBackground,
  Color? onSurface,
  Color? border,
  Color? tokenOn,
  Color? tokenOff,
  Color? dialogBackground,
  Color? dialogBorder,
  Color? inputBackground,
  Color? inputBorder,
  Color? inputFocusedBorder,
  Color? buttonSuccess,
  Color? buttonDanger,
  Color? buttonSecondary,
  Color? shadow,
}) {
  return AppColors(
    primary: primary ?? _defaultAppColors.primary,
    secondary: secondary ?? _defaultAppColors.secondary,
    accent: accent ?? _defaultAppColors.accent,
    surface: surface ?? _defaultAppColors.surface,
    cardBackground: cardBackground ?? _defaultAppColors.cardBackground,
    onSurface: onSurface ?? _defaultAppColors.onSurface,
    border: border ?? _defaultAppColors.border,
    tokenOn: tokenOn ?? _defaultAppColors.tokenOn,
    tokenOff: tokenOff ?? _defaultAppColors.tokenOff,
    dialogBackground: dialogBackground ?? _defaultAppColors.dialogBackground,
    dialogBorder: dialogBorder ?? _defaultAppColors.dialogBorder,
    inputBackground: inputBackground ?? _defaultAppColors.inputBackground,
    inputBorder: inputBorder ?? _defaultAppColors.inputBorder,
    inputFocusedBorder:
        inputFocusedBorder ?? _defaultAppColors.inputFocusedBorder,
    buttonSuccess: buttonSuccess ?? _defaultAppColors.buttonSuccess,
    buttonDanger: buttonDanger ?? _defaultAppColors.buttonDanger,
    buttonSecondary: buttonSecondary ?? _defaultAppColors.buttonSecondary,
    shadow: shadow ?? _defaultAppColors.shadow,
  );
}

Widget createLocalizedTestWidget({required Widget child}) {
  return MaterialApp(
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );
}

Widget createMaterialAppTestWidget({
  required Widget child,
  bool withScaffold = true,
  ThemeData? theme,
}) {
  return MaterialApp(
    theme: theme,
    home: withScaffold ? Scaffold(body: child) : child,
  );
}
