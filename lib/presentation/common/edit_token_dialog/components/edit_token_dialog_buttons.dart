import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog/components/edit_token_dialog_keys.dart';

class EditTokenCancelButton extends StatefulWidget {
  const EditTokenCancelButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  State<EditTokenCancelButton> createState() => _EditTokenCancelButtonState();
}

class _EditTokenCancelButtonState extends State<EditTokenCancelButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => _animationController.forward(),
        onTapUp: (_) => _animationController.reverse(),
        onTapCancel: () => _animationController.reverse(),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: _isHovered
                  ? appColors.buttonSecondary.withValues(alpha: 0.8)
                  : appColors.buttonSecondary,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isHovered
                    ? appColors.border.withValues(alpha: 0.6)
                    : appColors.border,
                width: 1,
              ),
            ),
            child: TextButton(
              key: editTokenCancelButtonKey,
              onPressed: widget.onPressed,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                widget.label,
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

class EditTokenDeleteButton extends StatefulWidget {
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
  State<EditTokenDeleteButton> createState() => _EditTokenDeleteButtonState();
}

class _EditTokenDeleteButtonState extends State<EditTokenDeleteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return MouseRegion(
      onEnter: (_) => widget.enabled ? setState(() => _isHovered = true) : null,
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) =>
            widget.enabled ? _animationController.forward() : null,
        onTapUp: (_) => _animationController.reverse(),
        onTapCancel: () => _animationController.reverse(),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: widget.enabled
                  ? (_isHovered
                        ? appColors.buttonDanger.withValues(alpha: 0.9)
                        : appColors.buttonDanger)
                  : appColors.buttonDanger.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
              boxShadow: widget.enabled && _isHovered
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
              onPressed: widget.enabled ? widget.onPressed : null,
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
                    color: Colors.white.withValues(
                      alpha: widget.enabled ? 1.0 : 0.6,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color: Colors.white.withValues(
                        alpha: widget.enabled ? 1.0 : 0.6,
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

class EditTokenSaveButton extends StatefulWidget {
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
  State<EditTokenSaveButton> createState() => _EditTokenSaveButtonState();
}

class _EditTokenSaveButtonState extends State<EditTokenSaveButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return MouseRegion(
      onEnter: (_) => widget.enabled ? setState(() => _isHovered = true) : null,
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) =>
            widget.enabled ? _animationController.forward() : null,
        onTapUp: (_) => _animationController.reverse(),
        onTapCancel: () => _animationController.reverse(),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: widget.enabled
                  ? (_isHovered
                        ? appColors.buttonSuccess.withValues(alpha: 0.9)
                        : appColors.buttonSuccess)
                  : appColors.buttonSuccess.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
              boxShadow: widget.enabled && _isHovered
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
              onPressed: widget.enabled ? widget.onPressed : null,
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
                    color: Colors.white.withValues(
                      alpha: widget.enabled ? 1.0 : 0.6,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color: Colors.white.withValues(
                        alpha: widget.enabled ? 1.0 : 0.6,
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
