// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MyHomeViewModel)
const myHomeViewModelProvider = MyHomeViewModelProvider._();

final class MyHomeViewModelProvider
    extends $AsyncNotifierProvider<MyHomeViewModel, MyHomeState> {
  const MyHomeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myHomeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myHomeViewModelHash();

  @$internal
  @override
  MyHomeViewModel create() => MyHomeViewModel();
}

String _$myHomeViewModelHash() => r'090455cbf6123f0388e916551a2f7db3bdca355b';

abstract class _$MyHomeViewModel extends $AsyncNotifier<MyHomeState> {
  FutureOr<MyHomeState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<MyHomeState>, MyHomeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MyHomeState>, MyHomeState>,
              AsyncValue<MyHomeState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
