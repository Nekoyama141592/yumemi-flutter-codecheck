import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/github/github_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';

part 'repository_item_view_model.g.dart';

@riverpod
class RepositoryItemViewModel extends _$RepositoryItemViewModel {
  @override
  FutureOr<SearchRepositoriesItemEntity?> build(
    String userName,
    String name,
  ) async {
    try {
      final repo = ref.read(githubRepositoryProvider());
      final item = await repo.getRepository(userName: userName, name: name);
      return item;
    } catch (e) {
      rethrow;
    }
  }
}

