abstract class LocalRepositoryInterface {
  Future<void> saveIsDarkTheme(bool isDarkMode);
  Future<bool> getIsDarkTheme();
}