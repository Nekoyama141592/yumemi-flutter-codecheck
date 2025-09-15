import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/repository/secure_storage_repository.dart';

class _FakeSecureStorage extends FlutterSecureStorage {
  final Map<String, String?> _store = {};

  @override
  Future<void> write({
    required String key,
    required String? value,
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) async {
    _store[key] = value;
  }

  @override
  Future<String?> read({
    required String key,
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) async {
    return _store[key];
  }

  @override
  Future<void> delete({
    required String key,
    IOSOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
  }) async {
    _store.remove(key);
  }
}

void main() {
  group('SecureStorageRepository', () {
    late SecureStorageRepository repository;
    late _FakeSecureStorage storage;

    setUp(() {
      storage = _FakeSecureStorage();
      repository = SecureStorageRepository(storage);
    });

    test('saveToken writes token under expected key', () async {
      await repository.saveToken('abc123');
      expect(await storage.read(key: 'github_token'), 'abc123');
    });

    test('getToken returns null when no token stored', () async {
      final token = await repository.getToken();
      expect(token, isNull);
    });

    test('getToken returns stored token', () async {
      await repository.saveToken('tok');
      final token = await repository.getToken();
      expect(token, 'tok');
    });

    test('deleteToken removes stored token', () async {
      await repository.saveToken('to-remove');
      await repository.deleteToken();
      final token = await repository.getToken();
      expect(token, isNull);
    });
  });
}
