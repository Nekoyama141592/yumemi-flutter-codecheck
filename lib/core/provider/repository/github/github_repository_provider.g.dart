// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(githubRepository)
const githubRepositoryProvider = GithubRepositoryFamily._();

final class GithubRepositoryProvider
    extends
        $FunctionalProvider<
          GithubRepository,
          GithubRepository,
          GithubRepository
        >
    with $Provider<GithubRepository> {
  const GithubRepositoryProvider._({
    required GithubRepositoryFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'githubRepositoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$githubRepositoryHash();

  @override
  String toString() {
    return r'githubRepositoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<GithubRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GithubRepository create(Ref ref) {
    final argument = this.argument as String?;
    return githubRepository(ref, token: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GithubRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GithubRepository>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GithubRepositoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$githubRepositoryHash() => r'7fc2a2174d68680bf686088064e5a94d0479f2de';

final class GithubRepositoryFamily extends $Family
    with $FunctionalFamilyOverride<GithubRepository, String?> {
  const GithubRepositoryFamily._()
    : super(
        retry: null,
        name: r'githubRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GithubRepositoryProvider call({String? token}) =>
      GithubRepositoryProvider._(argument: token, from: this);

  @override
  String toString() => r'githubRepositoryProvider';
}
