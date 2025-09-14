import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16 * scaleH),
            decoration: BoxDecoration(
              color: appColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: CircularProgressIndicator(
              color: appColors.primary,
              strokeWidth: 3,
            ),
          ),
          SizedBox(height: 24 * scaleH),
          Text(
            AppLocalizations.of(context)!.searchingRepositories,
            style: TextStyle(
              color: appColors.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
