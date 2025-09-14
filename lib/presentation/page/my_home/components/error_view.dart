import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.appColors, required this.error});
  final AppColors appColors;
  final Object error;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return Container(
      padding: EdgeInsets.all(32 * scaleH),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20 * scaleH),
              decoration: BoxDecoration(
                color: appColors.accent.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: appColors.accent,
              ),
            ),
            SizedBox(height: 24 * scaleH),
            Text(
              AppLocalizations.of(context)!.repoErrorSubtitle,
              style: TextStyle(
                color: appColors.onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12 * scaleH),
            Text(
              AppLocalizations.of(context)!.repoErrorTitle,
              style: TextStyle(
                color: appColors.secondary,
                fontSize: 14,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
