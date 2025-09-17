// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_api_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(githubApiClient)
const githubApiClientProvider = GithubApiClientFamily._();

final class GithubApiClientProvider
    extends
        $FunctionalProvider<GitHubApiClient, GitHubApiClient, GitHubApiClient>
    with $Provider<GitHubApiClient> {
  const GithubApiClientProvider._({
    required GithubApiClientFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'githubApiClientProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$githubApiClientHash();

  @override
  String toString() {
    return r'githubApiClientProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<GitHubApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GitHubApiClient create(Ref ref) {
    final argument = this.argument as String?;
    return githubApiClient(ref, token: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GitHubApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GitHubApiClient>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GithubApiClientProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$githubApiClientHash() => r'3ceb873d3b2bf359a0d1bac21564b39c9be54ee6';

final class GithubApiClientFamily extends $Family
    with $FunctionalFamilyOverride<GitHubApiClient, String?> {
  const GithubApiClientFamily._()
    : super(
        retry: null,
        name: r'githubApiClientProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GithubApiClientProvider call({String? token}) =>
      GithubApiClientProvider._(argument: token, from: this);

  @override
  String toString() => r'githubApiClientProvider';
}
