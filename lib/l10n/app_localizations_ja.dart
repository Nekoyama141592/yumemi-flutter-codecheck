// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get hello => 'こんにちは';

  @override
  String get editTokenTooltip => 'トークンを編集';

  @override
  String get editTokenTitle => 'トークンを編集';

  @override
  String get tokenLabel => 'トークン';

  @override
  String get tokenHint => 'GitHub パーソナルアクセストークン';

  @override
  String get cancel => 'キャンセル';

  @override
  String get delete => '削除';

  @override
  String get save => '保存';

  @override
  String error(Object error) {
    return 'エラー: $error';
  }
}
