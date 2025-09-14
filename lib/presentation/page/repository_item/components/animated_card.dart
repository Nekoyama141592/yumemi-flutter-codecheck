import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedCard extends HookWidget {
  const AnimatedCard({super.key, required this.child, required this.delay});

  final Widget child;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 800),
    );

    final slideAnimationTween =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    final fadeAnimationTween = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    useEffect(() {
      Future.delayed(delay, () {
        if (context.mounted) {
          animationController.forward();
        }
      });
      return null;
    }, []);

    return SlideTransition(
      position: slideAnimationTween,
      child: FadeTransition(opacity: fadeAnimationTween, child: child),
    );
  }
}
