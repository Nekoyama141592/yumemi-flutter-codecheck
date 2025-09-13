import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF0D1117),
  extensions: const [
    AppColors(
      tokenOn: Color(0xFF81C784), // ダーク背景用の緑（green 300）
      tokenOff: Color(0xFFE57373), // ダーク背景用の赤（red 300）
    ),
  ],
);
