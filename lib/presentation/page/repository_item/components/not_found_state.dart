import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class NotFoundState extends StatelessWidget {
  const NotFoundState({super.key, required this.appColors});

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32 * scaleH),
      decoration: BoxDecoration(
        color: appColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: appColors.border, width: 1),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16 * scaleH),
            decoration: BoxDecoration(
              color: appColors.secondary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search_off_rounded,
              size: 48,
              color: appColors.secondary,
            ),
          ),
          SizedBox(height: 16 * scaleH),
          Text(
            AppLocalizations.of(context)!.repoNotFoundTitle,
            style: TextStyle(
              color: appColors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8 * scaleH),
          Text(
            AppLocalizations.of(context)!.repoNotFoundSubtitle,
            style: TextStyle(color: appColors.secondary, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
