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
    return '错误';
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

  @override
  String get themeLightTooltip => '浅色模式';

  @override
  String get themeDarkTooltip => '深色模式';

  @override
  String get repositoryExplorer => '仓库浏览器';

  @override
  String get searchRepositories => '搜索仓库';

  @override
  String get searchFieldHint => '输入仓库名（例如：flutter、react）';

  @override
  String get searchingRepositories => '正在搜索仓库…';

  @override
  String get somethingWentWrong => '出现了一些问题';

  @override
  String get startExploring => '开始探索';

  @override
  String get startExploringSubtitle => '搜索 GitHub 仓库，发现精彩的项目和代码';

  @override
  String get repoErrorTitle => '发生错误';

  @override
  String get repoErrorSubtitle => '无法获取仓库信息';

  @override
  String get repoNotFoundTitle => '未找到仓库';

  @override
  String get repoNotFoundSubtitle => '指定的仓库不存在或无法访问';

  @override
  String get openInGitHub => '在 GitHub 中打开';
}
