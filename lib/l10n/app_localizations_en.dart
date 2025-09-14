// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get hello => 'Hello';

  @override
  String get editTokenTooltip => 'Edit token';

  @override
  String get editTokenTitle => 'Edit Token';

  @override
  String get tokenLabel => 'Token';

  @override
  String get tokenHint => 'GitHub Personal Access Token';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get save => 'Save';

  @override
  String get repositoryName => 'Repository';

  @override
  String get language => 'Language';

  @override
  String get unknown => 'Unknown';

  @override
  String get stars => 'Stars';

  @override
  String get watchers => 'Watchers';

  @override
  String get forks => 'Forks';

  @override
  String get issues => 'Issues';

  @override
  String get themeLightTooltip => 'Light Mode';

  @override
  String get themeDarkTooltip => 'Dark Mode';

  @override
  String get repositoryExplorer => 'Repository Explorer';

  @override
  String get searchRepositories => 'Search Repositories';

  @override
  String get searchFieldHint => 'Enter repository name (e.g. flutter, react)';

  @override
  String get searchingRepositories => 'Searching repositories...';

  @override
  String get startExploring => 'Start exploring';

  @override
  String get startExploringSubtitle => 'Search for GitHub repositories to discover amazing projects and code';

  @override
  String get repoErrorTitle => 'Failed to get repository information';

  @override
  String get repoErrorSubtitle => 'Please register your personal access token from the top right of the screen';

  @override
  String get repoNotFoundTitle => 'Repository not found';

  @override
  String get repoNotFoundSubtitle => 'The specified repository does not exist or is inaccessible';

  @override
  String get openInGitHub => 'Open in GitHub';
}
