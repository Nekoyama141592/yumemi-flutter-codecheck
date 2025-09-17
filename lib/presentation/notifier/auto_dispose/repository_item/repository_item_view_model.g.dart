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
          GetRepositoryItemEntity?
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
    r'1c7d1be8745d0814893483f4a1949228514da8c0';

final class RepositoryItemViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          RepositoryItemViewModel,
          AsyncValue<GetRepositoryItemEntity?>,
          GetRepositoryItemEntity?,
          FutureOr<GetRepositoryItemEntity?>,
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
    extends $AsyncNotifier<GetRepositoryItemEntity?> {
  late final _$args = ref.$arg as (String, String);
  String get userName => _$args.$1;
  String get name => _$args.$2;

  FutureOr<GetRepositoryItemEntity?> build(String userName, String name);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<GetRepositoryItemEntity?>,
              GetRepositoryItemEntity?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<GetRepositoryItemEntity?>,
                GetRepositoryItemEntity?
              >,
              AsyncValue<GetRepositoryItemEntity?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
