import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog/components/edit_token_dialog_keys.dart';

class EditTokenCancelButton extends StatelessWidget {
  const EditTokenCancelButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: editTokenCancelButtonKey,
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class EditTokenDeleteButton extends StatelessWidget {
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
    return TextButton(
      key: editTokenDeleteButtonKey,
      onPressed: enabled ? onPressed : null,
      child: Text(label),
    );
  }
}

class EditTokenSaveButton extends StatelessWidget {
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
    return ElevatedButton(
      key: editTokenSaveButtonKey,
      onPressed: enabled ? onPressed : null,
      child: Text(label),
    );
  }
}
