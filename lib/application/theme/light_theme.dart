import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFECDCC9),
  extensions: const [
    AppColors(
      tokenOn: Color(0xFF2E7D32), // ライト背景用の濃い緑
      tokenOff: Color(0xFFC62828), // ライト背景用の濃い赤
      cardBackground: Color(0xFFFFFFFF), // ライトカード背景
      surface: Color(0xFFF6F8FA), // サーフェス
      onSurface: Color(0xFF24292F), // サーフェス上のテキスト
      primary: Color(0xFF0969DA), // メインカラー（青）
      secondary: Color(0xFF656D76), // セカンダリ（グレー）
      accent: Color(0xFFCF222E), // アクセント（レッド）
      border: Color(0xFFD0D7DE), // ボーダー
      dialogBackground: Color(0xFFFEFEFE), // モダンダイアログ背景
      dialogBorder: Color(0xFFE1E4E8), // ダイアログボーダー
      inputBackground: Color(0xFFF6F8FA), // インプット背景
      inputBorder: Color(0xFFD0D7DE), // インプットボーダー
      inputFocusedBorder: Color(0xFF0969DA), // フォーカス時ボーダー
      buttonSuccess: Color(0xFF1A7F37), // 成功ボタン
      buttonDanger: Color(0xFFCF222E), // 危険ボタン
      buttonSecondary: Color(0xFFF6F8FA), // セカンダリボタン
      shadow: Color(0x20000000), // シャドウ
    ),
  ],
);
