import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
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
          loading: () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ShimmerCircle(radius: 42),
              const SizedBox(height: 16),
              Text('$userName/$name'),
            ],
          ),
          error: (_, _) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(radius: 42, child: Icon(Icons.error, size: 36)),
              const SizedBox(height: 16),
              Text('$userName/$name'),
            ],
          ),
          data: (repo) {
            if (repo == null) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(radius: 42, child: Icon(Icons.person, size: 36)),
                  const SizedBox(height: 16),
                  Text('$userName/$name'),
                ],
              );
            }

            final avatarUrl = repo.ownerAvatarUrl;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: avatarUrl == null || avatarUrl.isEmpty
                      ? const CircleAvatar(
                          radius: 42,
                          child: Icon(Icons.person, size: 36),
                        )
                      : CachedNetworkImage(
                          imageUrl: avatarUrl,
                          imageBuilder: (context, imageProvider) => CircleAvatar(
                            radius: 42,
                            backgroundImage: imageProvider,
                          ),
                          placeholder: (context, url) => const _ShimmerCircle(radius: 42),
                          errorWidget: (context, url, error) => const CircleAvatar(
                            radius: 42,
                            child: Icon(Icons.error, size: 36),
                          ),
                        ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('リポジトリ名: '),
                    Text(repo.fullName),
                  ],
                ),
                Row(
                  children: [
                    const Text('言語: '),
                    Text(repo.language ?? "不明"),
                  ],
                ),
                Row(
                  children: [
                    const Text('スター数: '),
                    Text('${repo.stargazersCount}'),
                  ],
                ),
                Row(
                  children: [
                    const Text('ウォッチャー数: '),
                    Text('${repo.watchersCount}'),
                  ],
                ),
                Row(
                  children: [
                    const Text('フォーク数: '),
                    Text('${repo.forksCount}'),
                  ],
                ),
                Row(
                  children: [
                    const Text('Issue数: '),
                    Text('${repo.openIssuesCount}'),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ShimmerCircle extends StatelessWidget {
  const _ShimmerCircle({required this.radius});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
      ),
    );
  }
}
