import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/auto_dispose/repository_item/repository_item_view_model.dart';

@RoutePage()
class RepositoryItemPage extends HookConsumerWidget {
  const RepositoryItemPage({
    super.key,
    @PathParam('userName') required this.userName,
    @PathParam('name') required this.name,
  });

  static const path = '/users/:userName/repositories/:name';

  static String generatePath({required String userName, required String name}) {
    return '/users/$userName/repositories/$name';
  }

  final String userName;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(repositoryItemViewModelProvider(userName, name));
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: state.when(
          loading: () => Text('$userName/$name'),
          error: (_, _) => Text('$userName/$name'),
          data: (repo) {
            if (repo == null) {
              return Text('$userName/$name');
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('リポジトリ名: ${repo.fullName}'),
                Text('オーナーアイコン: ${repo.ownerAvatarUrl ?? "なし"}'),
                Text('言語: ${repo.language ?? "不明"}'),
                Text('スター数: ${repo.stargazersCount}'),
                Text('ウォッチャー数: ${repo.watchersCount}'),
                Text('フォーク数: ${repo.forksCount}'),
                Text('Issue数: ${repo.openIssuesCount}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
