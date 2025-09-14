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
  String error(Object error) {
    return 'Error: $error';
  }
}
