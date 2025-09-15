import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';
import '../../../../l10n/app_localizations.dart';
import 'stat_item.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({
    super.key,
    required this.repo,
    required this.appColors,
    required this.isLandscape,
  });

  final GetRepositoryItemEntity repo;
  final AppColors appColors;
  final bool isLandscape;

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    final stats = [
      StatItem(
        icon: Icons.star_rounded,
        label: AppLocalizations.of(context)!.stars,
        value: _formatNumber(repo.stargazersCount),
        color: Colors.amber,
      ),
      StatItem(
        icon: Icons.visibility_rounded,
        label: AppLocalizations.of(context)!.watchers,
        value: _formatNumber(repo.watchersCount),
        color: Colors.blue,
      ),
      StatItem(
        icon: Icons.fork_right_rounded,
        label: AppLocalizations.of(context)!.forks,
        value: _formatNumber(repo.forksCount),
        color: Colors.green,
      ),
      StatItem(
        icon: Icons.bug_report_rounded,
        label: AppLocalizations.of(context)!.issues,
        value: _formatNumber(repo.openIssuesCount),
        color: Colors.red,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;
        final scaleH = (size.height / 812).clamp(0.8, 1.3);
        final spacing = (constraints.maxWidth * 0.03).clamp(8.0, 16.0);
        final minTileHeight = 120.0 * scaleH;
        final tentativeCols = (constraints.maxWidth / 160).floor();
        final crossAxisCount = tentativeCols.clamp(1, 4);
        final tileWidth =
            (constraints.maxWidth - spacing * (crossAxisCount - 1)) /
            crossAxisCount;
        final childAspectRatio = tileWidth / math.max(minTileHeight, 1);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: stats.length,
          itemBuilder: (context, index) {
            final stat = stats[index];
            return Container(
              padding: EdgeInsets.all(16 * scaleH),
              decoration: BoxDecoration(
                color: appColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: appColors.border, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isLandscape)
                    Container(
                      padding: EdgeInsets.all(8 * scaleH),
                      decoration: BoxDecoration(
                        color: stat.color.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(stat.icon, color: stat.color, size: 24),
                    ),
                  if (!isLandscape) SizedBox(height: 8 * scaleH),
                  Flexible(
                    child: Text(
                      stat.value,
                      style: TextStyle(
                        color: appColors.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      stat.label,
                      style: TextStyle(
                        color: appColors.secondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
