import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.tokenOn,
    required this.tokenOff,
    required this.cardBackground,
    required this.surface,
    required this.onSurface,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.border,
    required this.dialogBackground,
    required this.dialogBorder,
    required this.inputBackground,
    required this.inputBorder,
    required this.inputFocusedBorder,
    required this.buttonSuccess,
    required this.buttonDanger,
    required this.buttonSecondary,
    required this.shadow,
  });

  final Color tokenOn;
  final Color tokenOff;
  final Color cardBackground;
  final Color surface;
  final Color onSurface;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color border;
  final Color dialogBackground;
  final Color dialogBorder;
  final Color inputBackground;
  final Color inputBorder;
  final Color inputFocusedBorder;
  final Color buttonSuccess;
  final Color buttonDanger;
  final Color buttonSecondary;
  final Color shadow;

  @override
  AppColors copyWith({
    Color? tokenOn,
    Color? tokenOff,
    Color? cardBackground,
    Color? surface,
    Color? onSurface,
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? border,
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
      tokenOn: tokenOn ?? this.tokenOn,
      tokenOff: tokenOff ?? this.tokenOff,
      cardBackground: cardBackground ?? this.cardBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      border: border ?? this.border,
      dialogBackground: dialogBackground ?? this.dialogBackground,
      dialogBorder: dialogBorder ?? this.dialogBorder,
      inputBackground: inputBackground ?? this.inputBackground,
      inputBorder: inputBorder ?? this.inputBorder,
      inputFocusedBorder: inputFocusedBorder ?? this.inputFocusedBorder,
      buttonSuccess: buttonSuccess ?? this.buttonSuccess,
      buttonDanger: buttonDanger ?? this.buttonDanger,
      buttonSecondary: buttonSecondary ?? this.buttonSecondary,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      tokenOn: Color.lerp(tokenOn, other.tokenOn, t) ?? tokenOn,
      tokenOff: Color.lerp(tokenOff, other.tokenOff, t) ?? tokenOff,
      cardBackground:
          Color.lerp(cardBackground, other.cardBackground, t) ?? cardBackground,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      onSurface: Color.lerp(onSurface, other.onSurface, t) ?? onSurface,
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      accent: Color.lerp(accent, other.accent, t) ?? accent,
      border: Color.lerp(border, other.border, t) ?? border,
      dialogBackground:
          Color.lerp(dialogBackground, other.dialogBackground, t) ??
          dialogBackground,
      dialogBorder:
          Color.lerp(dialogBorder, other.dialogBorder, t) ?? dialogBorder,
      inputBackground:
          Color.lerp(inputBackground, other.inputBackground, t) ??
          inputBackground,
      inputBorder: Color.lerp(inputBorder, other.inputBorder, t) ?? inputBorder,
      inputFocusedBorder:
          Color.lerp(inputFocusedBorder, other.inputFocusedBorder, t) ??
          inputFocusedBorder,
      buttonSuccess:
          Color.lerp(buttonSuccess, other.buttonSuccess, t) ?? buttonSuccess,
      buttonDanger:
          Color.lerp(buttonDanger, other.buttonDanger, t) ?? buttonDanger,
      buttonSecondary:
          Color.lerp(buttonSecondary, other.buttonSecondary, t) ??
          buttonSecondary,
      shadow: Color.lerp(shadow, other.shadow, t) ?? shadow,
    );
  }
}
