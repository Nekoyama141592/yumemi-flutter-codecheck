import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('zh')
  ];

  /// A greeting message
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// Tooltip for editing the token
  ///
  /// In en, this message translates to:
  /// **'Edit token'**
  String get editTokenTooltip;

  /// Dialog title for editing the token
  ///
  /// In en, this message translates to:
  /// **'Edit Token'**
  String get editTokenTitle;

  /// Label for token text field
  ///
  /// In en, this message translates to:
  /// **'Token'**
  String get tokenLabel;

  /// Hint text for token text field
  ///
  /// In en, this message translates to:
  /// **'GitHub Personal Access Token'**
  String get tokenHint;

  /// Cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Delete button label
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Save button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Error text prefix with the given error description
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Label for repository name
  ///
  /// In en, this message translates to:
  /// **'Repository'**
  String get repositoryName;

  /// Label for programming language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Fallback for unknown value
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// Label for stargazers count
  ///
  /// In en, this message translates to:
  /// **'Stars'**
  String get stars;

  /// Label for watchers count
  ///
  /// In en, this message translates to:
  /// **'Watchers'**
  String get watchers;

  /// Label for forks count
  ///
  /// In en, this message translates to:
  /// **'Forks'**
  String get forks;

  /// Label for issues count
  ///
  /// In en, this message translates to:
  /// **'Issues'**
  String get issues;

  /// Tooltip showing switch to light theme
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get themeLightTooltip;

  /// Tooltip showing switch to dark theme
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get themeDarkTooltip;

  /// Subtitle under GitHub brand on home
  ///
  /// In en, this message translates to:
  /// **'Repository Explorer'**
  String get repositoryExplorer;

  /// Header for repository search section
  ///
  /// In en, this message translates to:
  /// **'Search Repositories'**
  String get searchRepositories;

  /// Hint text for search field
  ///
  /// In en, this message translates to:
  /// **'Enter repository name (e.g. flutter, react)'**
  String get searchFieldHint;

  /// Loading message while searching repos
  ///
  /// In en, this message translates to:
  /// **'Searching repositories...'**
  String get searchingRepositories;

  /// Generic error title
  ///
  /// In en, this message translates to:
  /// **'Failed to get repository information'**
  String get somethingWentWrong;

  /// Empty state title
  ///
  /// In en, this message translates to:
  /// **'Start exploring'**
  String get startExploring;

  /// Empty state subtitle
  ///
  /// In en, this message translates to:
  /// **'Search for GitHub repositories to discover amazing projects and code'**
  String get startExploringSubtitle;

  /// Repository page error title
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get repoErrorTitle;

  /// Repository page error subtitle
  ///
  /// In en, this message translates to:
  /// **'Failed to load repository information'**
  String get repoErrorSubtitle;

  /// Repository not found title
  ///
  /// In en, this message translates to:
  /// **'Repository not found'**
  String get repoNotFoundTitle;

  /// Repository not found subtitle
  ///
  /// In en, this message translates to:
  /// **'The specified repository does not exist or is inaccessible'**
  String get repoNotFoundSubtitle;

  /// Button label to open repo in GitHub
  ///
  /// In en, this message translates to:
  /// **'Open in GitHub'**
  String get openInGitHub;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
