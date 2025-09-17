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
    final screenSize = MediaQuery.of(context).size;
    final shortestSide = screenSize.shortestSide;
    final horizontalPadding = (shortestSide * 0.05)
        .clamp(16.0, 36.0)
        .toDouble();
    final verticalPadding = (screenSize.height * 0.015)
        .clamp(8.0, 20.0)
        .toDouble();
    final textSize = (shortestSide * 0.035).clamp(12.0, 16.0).toDouble();
    final borderRadiusValue = (shortestSide * 0.035)
        .clamp(10.0, 18.0)
        .toDouble();
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
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            decoration: BoxDecoration(
              color: isHovered.value
                  ? appColors.buttonSecondary.withValues(alpha: 0.8)
                  : appColors.buttonSecondary,
              borderRadius: BorderRadius.circular(borderRadiusValue),
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
                  fontSize: textSize,
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
