import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/core/provider/keep_alive/secure_storage/secure_storage_provider.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/repository/secure_storage_repository.dart';

part 'secure_storage_repository_provider.g.dart';

@riverpod
SecureStorageRepository secureStorageRepository(Ref ref) {
  final storage = ref.watch(secureStorageProvider);
  return SecureStorageRepository(storage);
}

