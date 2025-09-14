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
    );
  }
}
