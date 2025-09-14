import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF0D1117),
  extensions: const [
    AppColors(
      tokenOn: Color(0xFF81C784), // ダーク背景用の緑（green 300）
      tokenOff: Color(0xFFE57373), // ダーク背景用の赤（red 300）
      cardBackground: Color(0xFF161B22), // ダークカード背景
      surface: Color(0xFF21262D), // サーフェス
      onSurface: Color(0xFFE6EDF3), // サーフェス上のテキスト
      primary: Color(0xFF58A6FF), // メインカラー（青）
      secondary: Color(0xFF8B949E), // セカンダリ（グレー）
      accent: Color(0xFFFF7B72), // アクセント（オレンジレッド）
      border: Color(0xFF30363D), // ボーダー
    ),
  ],
);
