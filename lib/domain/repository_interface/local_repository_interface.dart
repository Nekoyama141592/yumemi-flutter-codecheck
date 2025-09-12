abstract class LocalRepositoryInterface {
  Future<void> saveIsDarkTheme(bool isDarkMode);
  bool getIsDarkTheme();
}