abstract class SecureStorageInterface {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}
