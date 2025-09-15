import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';
import 'shimmer_components.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key, required this.repo, required this.appColors});

  final GetRepositoryItemEntity repo;
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    final avatarUrl = repo.ownerAvatarUrl;
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    final pad = 24.0 * scaleH;
    final avatar = 80.0 * scaleH;
    final iconSize = 60.0 * scaleH;
    final gapM = 16.0 * scaleH;
    final gapS = 12.0 * scaleH;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(pad),
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
      child: Column(
        children: [
          avatarUrl == null || avatarUrl.isEmpty
              ? Container(
                  width: avatar,
                  height: avatar,
                  decoration: BoxDecoration(
                    color: appColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: iconSize,
                    color: appColors.primary,
                  ),
                )
              : CachedNetworkImage(
                  imageUrl: avatarUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: avatar,
                    height: avatar,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      ShimmerCircle(radius: 40 * scaleH),
                  errorWidget: (context, url, error) => Container(
                    width: avatar,
                    height: avatar,
                    decoration: BoxDecoration(
                      color: appColors.accent.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.error_outline_rounded,
                      size: 40 * scaleH,
                      color: appColors.accent,
                    ),
                  ),
                ),
          SizedBox(height: gapM),
          Text(
            repo.fullName,
            style: TextStyle(
              color: appColors.onSurface,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          if (repo.language != null) ...[
            SizedBox(height: gapS),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12 * scaleH,
                vertical: 6 * scaleH,
              ),
              decoration: BoxDecoration(
                color: appColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: appColors.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Text(
                repo.language!,
                style: TextStyle(
                  color: appColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
