import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';
import 'animated_list_item.dart';
import 'repository_card.dart';

class RepositoryListView extends StatelessWidget {
  const RepositoryListView({
    super.key,
    required this.appColors,
    required this.repositories,
    required this.onTapRepo,
  });

  final AppColors appColors;
  final List<SearchRepositoriesItemEntity> repositories;
  final ValueChanged<SearchRepositoriesItemEntity> onTapRepo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: 20 * scaleH,
        vertical: 8 * scaleH,
      ),
      itemCount: repositories.length,
      separatorBuilder: (context, index) => SizedBox(height: 12 * scaleH),
      itemBuilder: (context, index) {
        final repo = repositories[index];
        return AnimatedListItem(
          index: index,
          child: RepositoryCard(
            appColors: appColors,
            repo: repo,
            onTap: () => onTapRepo(repo),
          ),
        );
      },
    );
  }
}
