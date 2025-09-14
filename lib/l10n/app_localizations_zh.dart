// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get hello => '你好';

  @override
  String get editTokenTooltip => '编辑令牌';

  @override
  String get editTokenTitle => '编辑令牌';

  @override
  String get tokenLabel => '令牌';

  @override
  String get tokenHint => 'GitHub 个人访问令牌';

  @override
  String get cancel => '取消';

  @override
  String get delete => '删除';

  @override
  String get save => '保存';

  @override
  String error(Object error) {
    return '错误：$error';
  }

  @override
  String get repositoryName => '仓库名';

  @override
  String get language => '语言';

  @override
  String get unknown => '未知';

  @override
  String get stars => '星标数';

  @override
  String get watchers => '关注者数';

  @override
  String get forks => '分叉数';

  @override
  String get issues => '问题数';
}
