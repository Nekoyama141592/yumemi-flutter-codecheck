import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';
import 'animated_card.dart';
import 'header_card.dart';
import 'stats_grid.dart';
import 'action_buttons.dart';

class RepositoryContent extends StatelessWidget {
  const RepositoryContent({
    super.key,
    required this.repo,
    required this.appColors,
    required this.isLandscape,
    required this.onLaunchUrl,
  });

  final GetRepositoryItemEntity repo;
  final AppColors appColors;
  final bool isLandscape;
  final Future<void> Function(String?) onLaunchUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    final gap = 20.0 * scaleH;

    if (isLandscape) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AnimatedCard(
                  delay: const Duration(milliseconds: 200),
                  child: HeaderCard(repo: repo, appColors: appColors),
                ),
              ),
              SizedBox(width: gap),
              Expanded(
                child: AnimatedCard(
                  delay: const Duration(milliseconds: 400),
                  child: StatsGrid(
                    repo: repo,
                    appColors: appColors,
                    isLandscape: isLandscape,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: gap),
          AnimatedCard(
            delay: const Duration(milliseconds: 600),
            child: ActionButtons(
              repo: repo,
              appColors: appColors,
              onLaunchUrl: onLaunchUrl,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCard(
          delay: const Duration(milliseconds: 200),
          child: HeaderCard(repo: repo, appColors: appColors),
        ),
        SizedBox(height: gap),
        AnimatedCard(
          delay: const Duration(milliseconds: 400),
          child: StatsGrid(
            repo: repo,
            appColors: appColors,
            isLandscape: isLandscape,
          ),
        ),
        SizedBox(height: gap),
        AnimatedCard(
          delay: const Duration(milliseconds: 600),
          child: ActionButtons(
            repo: repo,
            appColors: appColors,
            onLaunchUrl: onLaunchUrl,
          ),
        ),
      ],
    );
  }
}
