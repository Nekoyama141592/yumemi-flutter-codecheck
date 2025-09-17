import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/core/provider/keep_alive/secure_storage/secure_storage_provider.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';

class _FakeSecureStorage extends FlutterSecureStorage {
  final Map<String, String?> _store = {};

  @override
  Future<void> write({
    required String key,
    required String? value,
    AppleOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    _store[key] = value;
  }

  @override
  Future<String?> read({
    required String key,
    AppleOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    return _store[key];
  }

  @override
  Future<void> delete({
    required String key,
    AppleOptions? iOptions = IOSOptions.defaultOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    _store.remove(key);
  }
}

void main() {
  test(
    'secureStorageRepositoryProvider works with provider override',
    () async {
      final fake = _FakeSecureStorage();
      final container = ProviderContainer(
        overrides: [secureStorageProvider.overrideWithValue(fake)],
      );

      final repo = container.read(secureStorageRepositoryProvider);

      await repo.saveToken('token-123');
      expect(await fake.read(key: 'github_token'), 'token-123');

      await repo.deleteToken();
      expect(await fake.read(key: 'github_token'), isNull);
    },
  );
}
