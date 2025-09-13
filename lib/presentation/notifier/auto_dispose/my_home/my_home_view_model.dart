import 'dart:developer' as developer;
import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/github/github_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/presentation/state/auto_dispose/my_home/my_home_state.dart';

part 'my_home_view_model.g.dart';

@riverpod
class MyHomeViewModel extends _$MyHomeViewModel {
  @override
  FutureOr<MyHomeState> build() async {
    try {
      final token = await ref.read(secureStorageRepositoryProvider).getToken();
      final repo = ref.read(githubRepositoryProvider(token: token));
      final items = await repo.searchRepositories(query: 'flutter');
      return MyHomeState(repositories: items, token: token);
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  Future<void> searchRepositories({
    required String query,
    String? sort,
    String? order,
    int? perPage,
    int? page,
  }) async {
    state = const AsyncValue.loading();
    try {
      final token = await ref.read(secureStorageRepositoryProvider).getToken();
      final repo = ref.read(githubRepositoryProvider(token: token));
      final items = await repo.searchRepositories(
        query: query,
        sort: sort,
        order: order,
        perPage: perPage,
        page: page,
      );
      state = AsyncValue.data(state.value!.copyWith(repositories: items));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
