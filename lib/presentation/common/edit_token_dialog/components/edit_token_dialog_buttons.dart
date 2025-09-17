import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/constants/edit_token_dialog_keys.dart';

class EditTokenCancelButton extends HookWidget {
  const EditTokenCancelButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final isHovered = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );
    final scaleAnimation = useMemoized(
      () => Tween<double>(begin: 1.0, end: 0.95).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      ),
      [animationController],
    );

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        onTapDown: (_) => animationController.forward(),
        onTapUp: (_) => animationController.reverse(),
        onTapCancel: () => animationController.reverse(),
        child: ScaleTransition(
          scale: scaleAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: isHovered.value
                  ? appColors.buttonSecondary.withValues(alpha: 0.8)
                  : appColors.buttonSecondary,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isHovered.value
                    ? appColors.border.withValues(alpha: 0.6)
                    : appColors.border,
                width: 1,
              ),
            ),
            child: TextButton(
              key: editTokenCancelButtonKey,
              onPressed: onPressed,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: appColors.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditTokenDeleteButton extends HookWidget {
  const EditTokenDeleteButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.enabled,
  });

  final String label;
  final VoidCallback onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final isHovered = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );
    final scaleAnimation = useMemoized(
      () => Tween<double>(begin: 1.0, end: 0.95).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      ),
      [animationController],
    );

    void handleTapDown(_) {
      if (!enabled) return;
      animationController.forward();
    }

    return MouseRegion(
      onEnter: (_) => enabled ? isHovered.value = true : null,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        onTapDown: handleTapDown,
        onTapUp: (_) => animationController.reverse(),
        onTapCancel: () => animationController.reverse(),
        child: ScaleTransition(
          scale: scaleAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: enabled
                  ? (isHovered.value
                        ? appColors.buttonDanger.withValues(alpha: 0.9)
                        : appColors.buttonDanger)
                  : appColors.buttonDanger.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
              boxShadow: enabled && isHovered.value
                  ? [
                      BoxShadow(
                        color: appColors.buttonDanger.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: TextButton(
              key: editTokenDeleteButtonKey,
              onPressed: enabled ? onPressed : null,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.delete_rounded,
                    size: 16,
                    color: Colors.white.withValues(alpha: enabled ? 1.0 : 0.6),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white.withValues(
                        alpha: enabled ? 1.0 : 0.6,
                      ),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditTokenSaveButton extends HookWidget {
  const EditTokenSaveButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.enabled,
  });

  final String label;
  final VoidCallback onPressed;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final isHovered = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );
    final scaleAnimation = useMemoized(
      () => Tween<double>(begin: 1.0, end: 0.95).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      ),
      [animationController],
    );

    void handleTapDown(_) {
      if (!enabled) return;
      animationController.forward();
    }

    return MouseRegion(
      onEnter: (_) => enabled ? isHovered.value = true : null,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        onTapDown: handleTapDown,
        onTapUp: (_) => animationController.reverse(),
        onTapCancel: () => animationController.reverse(),
        child: ScaleTransition(
          scale: scaleAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: enabled
                  ? (isHovered.value
                        ? appColors.buttonSuccess.withValues(alpha: 0.9)
                        : appColors.buttonSuccess)
                  : appColors.buttonSuccess.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
              boxShadow: enabled && isHovered.value
                  ? [
                      BoxShadow(
                        color: appColors.buttonSuccess.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: ElevatedButton(
              key: editTokenSaveButtonKey,
              onPressed: enabled ? onPressed : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                shadowColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.save_rounded,
                    size: 16,
                    color: Colors.white.withValues(alpha: enabled ? 1.0 : 0.6),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white.withValues(
                        alpha: enabled ? 1.0 : 0.6,
                      ),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
