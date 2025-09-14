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
  String get error => '画面の右上から個人用アクセストークンを登録してください';

  @override
  String get repositoryName => 'リポジトリ名';

  @override
  String get language => '言語';

  @override
  String get unknown => '不明';

  @override
  String get stars => 'スター数';

  @override
  String get watchers => 'ウォッチャー数';

  @override
  String get forks => 'フォーク数';

  @override
  String get issues => 'Issue数';

  @override
  String get themeLightTooltip => 'ライトモード';

  @override
  String get themeDarkTooltip => 'ダークモード';

  @override
  String get repositoryExplorer => 'リポジトリ検索アプリ';

  @override
  String get searchRepositories => 'リポジトリを検索';

  @override
  String get searchFieldHint => 'リポジトリ名を入力（例: flutter, react）';

  @override
  String get searchingRepositories => 'リポジトリを検索中...';

  @override
  String get somethingWentWrong => 'リポジトリ情報の取得に失敗しました';

  @override
  String get startExploring => '探索を始めましょう';

  @override
  String get startExploringSubtitle => 'GitHubのリポジトリを検索して素晴らしいプロジェクトやコードを見つけましょう';

  @override
  String get repoErrorTitle => 'エラーが発生しました';

  @override
  String get repoErrorSubtitle => 'リポジトリの情報を取得できませんでした';

  @override
  String get repoNotFoundTitle => 'リポジトリが見つかりません';

  @override
  String get repoNotFoundSubtitle => '指定されたリポジトリは存在しないか、アクセスできません';

  @override
  String get openInGitHub => 'GitHubで開く';
}
