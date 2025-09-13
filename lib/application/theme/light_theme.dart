import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFECDCC9),
  extensions: const [
    AppColors(
      tokenOn: Color(0xFF2E7D32), // ライト背景用の濃い緑
      tokenOff: Color(0xFFC62828), // ライト背景用の濃い赤
    ),
  ],
);
