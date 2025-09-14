import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/github/github_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';

part 'repository_item_view_model.g.dart';

@riverpod
class RepositoryItemViewModel extends _$RepositoryItemViewModel {
  @override
  FutureOr<GetRepositoryItemEntity?> build(
    String userName,
    String name,
  ) async {
    try {
      final token = await ref.read(secureStorageRepositoryProvider).getToken();
      final repo = ref.read(githubRepositoryProvider(token: token));
      final item = await repo.getRepository(userName: userName, name: name);
      return item;
    } catch (e) {
      rethrow;
    }
  }
}
