import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/constants/edit_token_dialog_keys.dart';

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
    final screenSize = MediaQuery.of(context).size;
    final shortestSide = screenSize.shortestSide;
    final horizontalPadding = (shortestSide * 0.05)
        .clamp(16.0, 40.0)
        .toDouble();
    final verticalPadding = (screenSize.height * 0.015)
        .clamp(8.0, 20.0)
        .toDouble();
    final contentSpacing = (shortestSide * 0.015).clamp(4.0, 16.0).toDouble();
    final iconSize = (shortestSide * 0.045).clamp(14.0, 22.0).toDouble();
    final textSize = (shortestSide * 0.035).clamp(12.0, 16.0).toDouble();
    final borderRadiusValue = (shortestSide * 0.035)
        .clamp(10.0, 18.0)
        .toDouble();
    final shadowBlur = (shortestSide * 0.02).clamp(6.0, 14.0).toDouble();
    final shadowOffset = screenSize.height * 0.005;
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
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            decoration: BoxDecoration(
              color: enabled
                  ? (isHovered.value
                        ? appColors.buttonDanger.withValues(alpha: 0.9)
                        : appColors.buttonDanger)
                  : appColors.buttonDanger.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(borderRadiusValue),
              boxShadow: enabled && isHovered.value
                  ? [
                      BoxShadow(
                        color: appColors.buttonDanger.withValues(alpha: 0.3),
                        blurRadius: shadowBlur,
                        offset: Offset(0, shadowOffset),
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
                    size: iconSize,
                    color: Colors.white.withValues(alpha: enabled ? 1.0 : 0.6),
                  ),
                  SizedBox(width: contentSpacing),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white.withValues(
                        alpha: enabled ? 1.0 : 0.6,
                      ),
                      fontSize: textSize,
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
