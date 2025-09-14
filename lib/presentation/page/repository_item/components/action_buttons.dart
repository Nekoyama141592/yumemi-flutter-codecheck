import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';
import '../../../../l10n/app_localizations.dart';
import 'animated_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.repo,
    required this.appColors,
    required this.onLaunchUrl,
  });

  final GetRepositoryItemEntity repo;
  final AppColors appColors;
  final Future<void> Function(String?) onLaunchUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20 * scaleH),
      decoration: BoxDecoration(
        color: appColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: appColors.border, width: 1),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: AnimatedButton(
              onPressed: () => onLaunchUrl(repo.htmlUrl),
              child: ElevatedButton.icon(
                onPressed: () => onLaunchUrl(repo.htmlUrl),
                icon: const Icon(Icons.open_in_browser_rounded),
                label: Text(AppLocalizations.of(context)!.openInGitHub),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 16 * scaleH),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
