import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';

abstract class GithubRepositoryInterface {
  Future<List<SearchRepositoriesItemEntity>> searchRepositories({
    required String query,
    String? sort,
    String? order,
    int? perPage,
    int? page,
  });

  Future<GetRepositoryItemEntity?> getRepository({
    required String userName,
    required String name,
  });
}
