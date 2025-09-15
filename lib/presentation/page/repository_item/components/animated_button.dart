import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedButton extends HookWidget {
  const AnimatedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final scaleController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    final scaleAnimationTween = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOut),
    );

    return GestureDetector(
      onTapDown: (_) {
        HapticFeedback.lightImpact();
        scaleController.forward();
      },
      onTapUp: (_) {
        scaleController.reverse();
        onPressed();
      },
      onTapCancel: () {
        scaleController.reverse();
      },
      child: ScaleTransition(scale: scaleAnimationTween, child: child),
    );
  }
}
