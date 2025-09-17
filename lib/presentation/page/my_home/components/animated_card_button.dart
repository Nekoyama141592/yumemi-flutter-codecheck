import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedCardButton extends HookWidget {
  const AnimatedCardButton({
    super.key,
    required this.onTap,
    required this.borderRadius,
    required this.child,
  });

  final VoidCallback onTap;
  final BorderRadius borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scaleController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final elevationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    final scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOut),
    );

    final elevationAnimation = Tween<double>(begin: 0.0, end: 8.0).animate(
      CurvedAnimation(parent: elevationController, curve: Curves.easeInOut),
    );

    return MouseRegion(
      onEnter: (_) => elevationController.forward(),
      onExit: (_) => elevationController.reverse(),
      child: GestureDetector(
        onTapDown: (_) {
          HapticFeedback.selectionClick();
          scaleController.forward();
        },
        onTapUp: (_) {
          scaleController.reverse();
          onTap();
        },
        onTapCancel: () => scaleController.reverse(),
        child: AnimatedBuilder(
          animation: Listenable.merge([scaleAnimation, elevationAnimation]),
          builder: (context, child) => Transform.scale(
            scale: scaleAnimation.value,
            child: Material(
              elevation: elevationAnimation.value,
              borderRadius: borderRadius,
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: borderRadius,
                child: this.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
