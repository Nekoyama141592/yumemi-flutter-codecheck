import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yumemi_flutter_codecheck/domain/repository_interface/secure_storage_interface.dart';

class SecureStorageRepository implements SecureStorageInterface {
  SecureStorageRepository(this._storage);

  final FlutterSecureStorage _storage;

  static const _tokenKey = 'github_token';

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return _storage.read(key: _tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }
}
