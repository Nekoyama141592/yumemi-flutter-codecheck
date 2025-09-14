import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';
import 'package:yumemi_flutter_codecheck/domain/repository_interface/github_repository_interface.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/datasource/github/github_api_client.dart';

class GithubRepository implements GithubRepositoryInterface {
  GithubRepository(this._apiClient);

  final GitHubApiClient _apiClient;

  @override
  Future<List<SearchRepositoriesItemEntity>> searchRepositories({
    required String query,
    String? sort,
    String? order,
    int? perPage,
    int? page,
  }) async {
    final response = await _apiClient.searchRepositories(
      query,
      sort,
      order,
      perPage,
      page,
    );

    return response.items
        .map(SearchRepositoriesItemEntity.fromModel)
        .toList(growable: false);
  }

  @override
  Future<SearchRepositoriesItemEntity?> getRepository({
    required String userName,
    required String name,
  }) async {
    final q = '$userName/$name';
    final response = await _apiClient.searchRepositories(q, null, null, 1, 1);
    if (response.items.isEmpty) return null;
    return SearchRepositoriesItemEntity.fromModel(response.items.first);
  }
}
