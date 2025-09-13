// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secure_storage_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(secureStorageRepository)
const secureStorageRepositoryProvider = SecureStorageRepositoryProvider._();

final class SecureStorageRepositoryProvider
    extends
        $FunctionalProvider<
          SecureStorageRepository,
          SecureStorageRepository,
          SecureStorageRepository
        >
    with $Provider<SecureStorageRepository> {
  const SecureStorageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageRepositoryHash();

  @$internal
  @override
  $ProviderElement<SecureStorageRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SecureStorageRepository create(Ref ref) {
    return secureStorageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecureStorageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecureStorageRepository>(value),
    );
  }
}

String _$secureStorageRepositoryHash() =>
    r'e1b94a9be8d6dcdfe6992daa295b89cb110f6efe';
