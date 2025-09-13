import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';
import 'package:yumemi_flutter_codecheck/domain/repository_interface/github_repository_interface.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/datasource/github/github_api_client.dart';

class GithubRepository implements GithubRepositoryInterface {
  GithubRepository(this._apiClient);

  final GitHubApiClient _apiClient;

  @override
  Future<List<SearchRepositoriesItemEntity>> searchRepositories(
    String query,
    String sort,
    String order,
    int perPage,
    int page,
  ) async {
    final response = await _apiClient.searchRepositories(
      query,
      sort,
      order,
      perPage,
      page,
    );

    return response.items
        .map(
          (e) => SearchRepositoriesItemEntity(
            id: e.id,
            fullName: e.fullName,
            htmlUrl: e.htmlUrl,
          ),
        )
        .toList(growable: false);
  }
}
