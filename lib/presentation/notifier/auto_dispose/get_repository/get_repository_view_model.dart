import 'dart:developer' as developer;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/github/github_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';

part 'get_repository_view_model.g.dart';

@riverpod
class GetRepositoryViewModel extends _$GetRepositoryViewModel {
  @override
  FutureOr<GetRepositoryItemEntity?> build(String userName, String name) async {
    try {
      final repo = ref.read(githubRepositoryProvider());
      final result = await repo.getRepository(userName: userName, name: name);
      return result;
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }
}
