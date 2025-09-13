import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/core/provider/datasource/github/github_api_client_provider.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/repository/github_repository.dart';

part 'github_repository_provider.g.dart';

@riverpod
GithubRepository githubRepository(Ref ref, {String? token}) {
  final api = ref.watch(githubApiClientProvider(token: token));
  return GithubRepository(api);
}
