// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localRepository)
const localRepositoryProvider = LocalRepositoryProvider._();

final class LocalRepositoryProvider
    extends
        $FunctionalProvider<LocalRepository, LocalRepository, LocalRepository>
    with $Provider<LocalRepository> {
  const LocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalRepository create(Ref ref) {
    return localRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepository>(value),
    );
  }
}

String _$localRepositoryHash() => r'0ae6906044ee85ac9d17a71c57cbf5585d591adf';
