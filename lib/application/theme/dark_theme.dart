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
      dialogBackground: Color(0xFF1C2128), // モダンダイアログ背景
      dialogBorder: Color(0xFF3D444D), // ダイアログボーダー
      inputBackground: Color(0xFF0D1117), // インプット背景
      inputBorder: Color(0xFF30363D), // インプットボーダー
      inputFocusedBorder: Color(0xFF58A6FF), // フォーカス時ボーダー
      buttonSuccess: Color(0xFF238636), // 成功ボタン
      buttonDanger: Color(0xFFDA3633), // 危険ボタン
      buttonSecondary: Color(0xFF373E47), // セカンダリボタン
      shadow: Color(0x40000000), // シャドウ
    ),
  ],
);
