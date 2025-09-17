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
          SecureStorageInterface,
          SecureStorageInterface,
          SecureStorageInterface
        >
    with $Provider<SecureStorageInterface> {
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
  $ProviderElement<SecureStorageInterface> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SecureStorageInterface create(Ref ref) {
    return secureStorageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecureStorageInterface value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecureStorageInterface>(value),
    );
  }
}

String _$secureStorageRepositoryHash() =>
    r'2e193e174e756815885aa024f91c0885e072f851';
