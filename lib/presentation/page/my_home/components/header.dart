import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.isDark,
    required this.token,
    required this.appColors,
    required this.onToggleTheme,
    required this.onEditToken,
  });

  final bool isDark;
  final String? token;
  final AppColors appColors;
  final VoidCallback onToggleTheme;
  final VoidCallback onEditToken;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20 * scaleH, 20 * scaleH, 20 * scaleH, 0),
      decoration: BoxDecoration(
        color: appColors.surface,
        boxShadow: [
          BoxShadow(
            color: appColors.onSurface.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GitHub',
                      style: TextStyle(
                        color: appColors.onSurface,
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.repositoryExplorer,
                      style: TextStyle(
                        color: appColors.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: appColors.cardBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: appColors.border),
                    ),
                    child: IconButton(
                      tooltip: isDark
                          ? AppLocalizations.of(context)!.themeLightTooltip
                          : AppLocalizations.of(context)!.themeDarkTooltip,
                      onPressed: onToggleTheme,
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          isDark
                              ? Icons.light_mode_rounded
                              : Icons.dark_mode_rounded,
                          key: ValueKey(isDark),
                          color: appColors.primary,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12 * scaleH),
                  Container(
                    decoration: BoxDecoration(
                      color: token != null
                          ? appColors.tokenOn.withValues(alpha: 0.1)
                          : appColors.tokenOff.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: token != null
                            ? appColors.tokenOn
                            : appColors.tokenOff,
                        width: 1.5,
                      ),
                    ),
                    child: IconButton(
                      tooltip: AppLocalizations.of(context)!.editTokenTooltip,
                      onPressed: onEditToken,
                      icon: Icon(
                        Icons.vpn_key_rounded,
                        color: token != null
                            ? appColors.tokenOn
                            : appColors.tokenOff,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20 * scaleH),
        ],
      ),
    );
  }
}
