import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/l10n/app_localizations.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog/components/edit_token_cancel_button.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog/components/edit_token_delete_button.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog/components/edit_token_save_button.dart';
import 'package:yumemi_flutter_codecheck/presentation/constants/edit_token_dialog_keys.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/auto_dispose/my_home/my_home_view_model.dart';

class EditTokenDialog extends HookConsumerWidget {
  const EditTokenDialog({super.key});

  static Future<void> show(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.7),
      barrierDismissible: true,
      builder: (context) => const EditTokenDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(secureStorageRepositoryProvider);
    final controller = useTextEditingController();
    final loading = useState(true);
    final obscure = useState(true);

    useEffect(() {
      () async {
        final token = await repository.getToken();
        controller.text = token ?? '';
        loading.value = false;
      }();
      return null;
    }, [repository]);

    Future<void> save() async {
      final value = controller.text.trim();
      if (value.isEmpty) {
        await repository.deleteToken();
      } else {
        await repository.saveToken(value);
      }
      // Reflect changes in UI (token color, etc.)
      ref.invalidate(myHomeViewModelProvider);
      if (context.mounted) Navigator.of(context).pop();
    }

    Future<void> deleteToken() async {
      await repository.deleteToken();
      ref.invalidate(myHomeViewModelProvider);
      if (context.mounted) Navigator.of(context).pop();
    }

    final appColors = Theme.of(context).extension<AppColors>()!;
    final screenSize = MediaQuery.of(context).size;
    final shortestSide = screenSize.shortestSide;
    final dialogWidth = shortestSide * 0.85;
    final dialogConstraints = BoxConstraints(
      maxWidth: shortestSide * 0.9,
      maxHeight: screenSize.height * 0.9,
    );
    final dialogPadding = EdgeInsets.symmetric(
      horizontal: screenSize.width * 0.06,
      vertical: screenSize.height * 0.05,
    );
    final headerSpacing = screenSize.height * 0.015;
    final subtitleSpacing = headerSpacing * 0.6;
    final sectionSpacing = screenSize.height * 0.04;
    final buttonSpacing = screenSize.height * 0.02;
    final iconContainerPadding = EdgeInsets.all(shortestSide * 0.025);
    final inputPrefixPadding = EdgeInsets.all(shortestSide * 0.03);
    final contentPadding = EdgeInsets.all(shortestSide * 0.035);
    final progressHeight = screenSize.height * 0.12;
    final progressSize = shortestSide * 0.05;
    final horizontalGap = screenSize.width * 0.04;
    final dialogRadius = (shortestSide * 0.06).clamp(18.0, 32.0).toDouble();
    final mediumRadius = (shortestSide * 0.045).clamp(14.0, 24.0).toDouble();
    final smallRadius = (shortestSide * 0.035).clamp(10.0, 18.0).toDouble();
    final heroIconSize = (shortestSide * 0.06).clamp(22.0, 30.0).toDouble();
    final textFieldIconSize = (shortestSide * 0.045)
        .clamp(18.0, 24.0)
        .toDouble();
    final visibilityIconSize = (shortestSide * 0.045)
        .clamp(18.0, 24.0)
        .toDouble();
    final titleFontSize = (shortestSide * 0.065).clamp(20.0, 28.0).toDouble();
    final subtitleFontSize = (shortestSide * 0.038)
        .clamp(12.0, 18.0)
        .toDouble();
    final textFieldFontSize = (shortestSide * 0.045)
        .clamp(14.0, 20.0)
        .toDouble();
    final labelFontSize = (shortestSide * 0.035).clamp(12.0, 16.0).toDouble();
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );
    final scaleAnimation = useAnimation(
      animationController.drive(
        Tween<double>(
          begin: 0.8,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.elasticOut)),
      ),
    );
    final fadeAnimation = useAnimation(
      animationController.drive(
        Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
      ),
    );
    final slideAnimation = useAnimation(
      animationController.drive(
        Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
      ),
    );

    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Opacity(
        opacity: fadeAnimation,
        child: Transform.translate(
          offset: slideAnimation,
          child: Transform.scale(
            scale: scaleAnimation,
            child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Container(
                width: dialogWidth,
                constraints: dialogConstraints,
                decoration: BoxDecoration(
                  color: appColors.dialogBackground,
                  borderRadius: BorderRadius.circular(dialogRadius),
                  border: Border.all(color: appColors.dialogBorder, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: appColors.shadow,
                      blurRadius: (shortestSide * 0.08).clamp(20.0, 40.0),
                      offset: Offset(0, screenSize.height * 0.02),
                      spreadRadius: -4,
                    ),
                    BoxShadow(
                      color: appColors.shadow.withValues(alpha: 0.1),
                      blurRadius: (shortestSide * 0.16).clamp(32.0, 72.0),
                      offset: Offset(0, screenSize.height * 0.04),
                      spreadRadius: -12,
                    ),
                  ],
                ),
                child: Padding(
                  padding: dialogPadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: iconContainerPadding,
                            decoration: BoxDecoration(
                              color: appColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(smallRadius),
                            ),
                            child: Icon(
                              Icons.vpn_key_rounded,
                              color: appColors.primary,
                              size: heroIconSize,
                            ),
                          ),
                          SizedBox(width: horizontalGap),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.editTokenTitle,
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: appColors.onSurface,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                SizedBox(height: subtitleSpacing),
                                Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.editTokenSubtitle,
                                  style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    color: appColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: sectionSpacing),
                      if (loading.value)
                        Container(
                          height: progressHeight,
                          decoration: BoxDecoration(
                            color: appColors.inputBackground,
                            borderRadius: BorderRadius.circular(mediumRadius),
                            border: Border.all(
                              color: appColors.inputBorder,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: progressSize,
                              height: progressSize,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: appColors.primary,
                              ),
                            ),
                          ),
                        )
                      else
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: appColors.inputBackground,
                            borderRadius: BorderRadius.circular(mediumRadius),
                            border: Border.all(
                              color: controller.text.isNotEmpty
                                  ? appColors.inputFocusedBorder
                                  : appColors.inputBorder,
                              width: controller.text.isNotEmpty ? 2 : 1,
                            ),
                          ),
                          child: TextField(
                            key: editTokenTextFieldKey,
                            controller: controller,
                            obscureText: obscure.value,
                            style: TextStyle(
                              color: appColors.onSurface,
                              fontSize: textFieldFontSize,
                              fontFamily: 'monospace',
                              letterSpacing: 0.5,
                            ),
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(
                                context,
                              )!.tokenLabel,
                              hintText: AppLocalizations.of(context)!.tokenHint,
                              labelStyle: TextStyle(
                                color: appColors.secondary,
                                fontSize: labelFontSize,
                              ),
                              hintStyle: TextStyle(
                                color: appColors.secondary.withValues(
                                  alpha: 0.6,
                                ),
                                fontSize: labelFontSize,
                              ),
                              prefixIcon: Padding(
                                padding: inputPrefixPadding,
                                child: Icon(
                                  Icons.key_rounded,
                                  color: appColors.secondary,
                                  size: textFieldIconSize,
                                ),
                              ),
                              suffixIcon: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 150),
                                child: IconButton(
                                  key: ValueKey(obscure.value),
                                  onPressed: () {
                                    HapticFeedback.lightImpact();
                                    obscure.value = !obscure.value;
                                  },
                                  icon: Icon(
                                    obscure.value
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded,
                                    color: appColors.secondary,
                                    size: visibilityIconSize,
                                  ),
                                  tooltip: obscure.value
                                      ? AppLocalizations.of(
                                          context,
                                        )!.tokenVisibilityShow
                                      : AppLocalizations.of(
                                          context,
                                        )!.tokenVisibilityHide,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: contentPadding,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                          ),
                        ),
                      SizedBox(height: sectionSpacing),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          EditTokenSaveButton(
                            label: AppLocalizations.of(context)!.save,
                            onPressed: () {
                              HapticFeedback.lightImpact();
                              save();
                            },
                            enabled: !loading.value,
                          ),
                          SizedBox(height: buttonSpacing),
                          EditTokenDeleteButton(
                            label: AppLocalizations.of(context)!.delete,
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              deleteToken();
                            },
                            enabled: !loading.value,
                          ),
                          SizedBox(height: buttonSpacing),
                          EditTokenCancelButton(
                            label: AppLocalizations.of(context)!.cancel,
                            onPressed: () {
                              HapticFeedback.lightImpact();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
