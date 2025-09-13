import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({required this.tokenOn, required this.tokenOff});

  final Color tokenOn;
  final Color tokenOff;

  @override
  AppColors copyWith({Color? tokenOn, Color? tokenOff}) {
    return AppColors(
      tokenOn: tokenOn ?? this.tokenOn,
      tokenOff: tokenOff ?? this.tokenOff,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      tokenOn: Color.lerp(tokenOn, other.tokenOn, t) ?? tokenOn,
      tokenOff: Color.lerp(tokenOff, other.tokenOff, t) ?? tokenOff,
    );
  }
}
