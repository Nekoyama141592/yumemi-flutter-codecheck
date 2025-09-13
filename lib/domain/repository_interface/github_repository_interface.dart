import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';

abstract class GithubRepositoryInterface {
  Future<List<SearchRepositoriesItemEntity>> searchRepositories(
    String query,
    String sort,
    String order,
    int perPage,
    int page,
  );
}
