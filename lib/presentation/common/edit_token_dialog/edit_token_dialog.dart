import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/l10n/app_localizations.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog/components/edit_token_dialog_buttons.dart';
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
                width: 420,
                constraints: const BoxConstraints(maxWidth: 500),
                decoration: BoxDecoration(
                  color: appColors.dialogBackground,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: appColors.dialogBorder, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: appColors.shadow,
                      blurRadius: 32,
                      offset: const Offset(0, 16),
                      spreadRadius: -4,
                    ),
                    BoxShadow(
                      color: appColors.shadow.withValues(alpha: 0.1),
                      blurRadius: 64,
                      offset: const Offset(0, 32),
                      spreadRadius: -12,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: appColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.vpn_key_rounded,
                              color: appColors.primary,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.editTokenTitle,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: appColors.onSurface,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.editTokenSubtitle,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: appColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      if (loading.value)
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: appColors.inputBackground,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: appColors.inputBorder,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
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
                            borderRadius: BorderRadius.circular(16),
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
                              fontSize: 16,
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
                                fontSize: 14,
                              ),
                              hintStyle: TextStyle(
                                color: appColors.secondary.withValues(
                                  alpha: 0.6,
                                ),
                                fontSize: 14,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Icon(
                                  Icons.key_rounded,
                                  color: appColors.secondary,
                                  size: 20,
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
                                    size: 20,
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
                              contentPadding: const EdgeInsets.all(20),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            onChanged: (value) {
                              // Trigger rebuild for border animation
                            },
                          ),
                        ),
                      const SizedBox(height: 32),
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
                          const SizedBox(height: 12),
                          EditTokenDeleteButton(
                            label: AppLocalizations.of(context)!.delete,
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              deleteToken();
                            },
                            enabled: !loading.value,
                          ),
                          const SizedBox(height: 12),
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
