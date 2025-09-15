import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';
import 'animated_card_button.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({
    super.key,
    required this.appColors,
    required this.repo,
    required this.onTap,
  });

  final AppColors appColors;
  final SearchRepositoriesItemEntity repo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return Container(
      decoration: BoxDecoration(
        color: appColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: appColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: appColors.onSurface.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AnimatedCardButton(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.all(20 * scaleH),
          child: Row(
            children: [
              SizedBox(width: 12 * scaleH),
              Expanded(
                child: Text(
                  repo.fullName,
                  style: TextStyle(
                    color: appColors.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: appColors.secondary,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
