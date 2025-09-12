import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumemi_flutter_codecheck/domain/repository_interface/local_repository_interface.dart';

class LocalRepository implements LocalRepositoryInterface {
  const LocalRepository(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> saveIsDarkMode(bool isDarkMode) async {
    await _prefs.setBool('isDarkMode', isDarkMode);
  }

  @override
  bool getIsDarkMode() {
    return _prefs.getBool('isDarkMode') ?? true;
  }
}
