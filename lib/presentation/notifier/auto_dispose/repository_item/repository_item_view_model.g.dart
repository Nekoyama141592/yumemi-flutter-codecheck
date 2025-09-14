// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_item_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RepositoryItemViewModel)
const repositoryItemViewModelProvider = RepositoryItemViewModelFamily._();

final class RepositoryItemViewModelProvider
    extends
        $AsyncNotifierProvider<
          RepositoryItemViewModel,
          SearchRepositoriesItemEntity?
        > {
  const RepositoryItemViewModelProvider._({
    required RepositoryItemViewModelFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'repositoryItemViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$repositoryItemViewModelHash();

  @override
  String toString() {
    return r'repositoryItemViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  RepositoryItemViewModel create() => RepositoryItemViewModel();

  @override
  bool operator ==(Object other) {
    return other is RepositoryItemViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$repositoryItemViewModelHash() =>
    r'7e48d6c7a6e4263c5d05a39368b6cc2259d53e32';

final class RepositoryItemViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          RepositoryItemViewModel,
          AsyncValue<SearchRepositoriesItemEntity?>,
          SearchRepositoriesItemEntity?,
          FutureOr<SearchRepositoriesItemEntity?>,
          (String, String)
        > {
  const RepositoryItemViewModelFamily._()
    : super(
        retry: null,
        name: r'repositoryItemViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RepositoryItemViewModelProvider call(String userName, String name) =>
      RepositoryItemViewModelProvider._(argument: (userName, name), from: this);

  @override
  String toString() => r'repositoryItemViewModelProvider';
}

abstract class _$RepositoryItemViewModel
    extends $AsyncNotifier<SearchRepositoriesItemEntity?> {
  late final _$args = ref.$arg as (String, String);
  String get userName => _$args.$1;
  String get name => _$args.$2;

  FutureOr<SearchRepositoriesItemEntity?> build(String userName, String name);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<SearchRepositoriesItemEntity?>,
              SearchRepositoriesItemEntity?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<SearchRepositoriesItemEntity?>,
                SearchRepositoriesItemEntity?
              >,
              AsyncValue<SearchRepositoriesItemEntity?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
