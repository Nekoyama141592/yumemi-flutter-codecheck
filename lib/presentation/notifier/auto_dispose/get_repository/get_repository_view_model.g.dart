// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repository_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetRepositoryViewModel)
const getRepositoryViewModelProvider = GetRepositoryViewModelFamily._();

final class GetRepositoryViewModelProvider
    extends
        $AsyncNotifierProvider<
          GetRepositoryViewModel,
          GetRepositoryItemEntity?
        > {
  const GetRepositoryViewModelProvider._({
    required GetRepositoryViewModelFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'getRepositoryViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getRepositoryViewModelHash();

  @override
  String toString() {
    return r'getRepositoryViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  GetRepositoryViewModel create() => GetRepositoryViewModel();

  @override
  bool operator ==(Object other) {
    return other is GetRepositoryViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getRepositoryViewModelHash() =>
    r'bb019ffbccf18bb5f7b01ec9189b73dd803c3886';

final class GetRepositoryViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          GetRepositoryViewModel,
          AsyncValue<GetRepositoryItemEntity?>,
          GetRepositoryItemEntity?,
          FutureOr<GetRepositoryItemEntity?>,
          (String, String)
        > {
  const GetRepositoryViewModelFamily._()
    : super(
        retry: null,
        name: r'getRepositoryViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetRepositoryViewModelProvider call(String userName, String name) =>
      GetRepositoryViewModelProvider._(argument: (userName, name), from: this);

  @override
  String toString() => r'getRepositoryViewModelProvider';
}

abstract class _$GetRepositoryViewModel
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
