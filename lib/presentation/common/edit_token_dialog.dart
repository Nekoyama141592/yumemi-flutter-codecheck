import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/l10n/app_localizations.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/components/edit_token_dialog_buttons.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/components/edit_token_dialog_keys.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/auto_dispose/my_home/my_home_view_model.dart';

class EditTokenDialog extends HookConsumerWidget {
  const EditTokenDialog({super.key});

  static Future<void> show(BuildContext context) async {
    await showDialog<void>(
      context: context,
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

    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.editTokenTitle),
      content: SizedBox(
        width: 400,
        child: loading.value
            ? const SizedBox(
                height: 56,
                child: Center(child: CircularProgressIndicator()),
              )
            : TextField(
                key: editTokenTextFieldKey,
                controller: controller,
                obscureText: obscure.value,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.tokenLabel,
                  hintText: AppLocalizations.of(context)!.tokenHint,
                  prefixIcon: const Icon(Icons.vpn_key),
                  suffixIcon: IconButton(
                    onPressed: () => obscure.value = !obscure.value,
                    icon: Icon(
                      obscure.value ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
      ),
      actions: [
        EditTokenCancelButton(
          label: AppLocalizations.of(context)!.cancel,
          onPressed: () => Navigator.of(context).pop(),
        ),
        EditTokenDeleteButton(
          label: AppLocalizations.of(context)!.delete,
          onPressed: deleteToken,
          enabled: !loading.value,
        ),
        EditTokenSaveButton(
          label: AppLocalizations.of(context)!.save,
          onPressed: save,
          enabled: !loading.value,
        ),
      ],
    );
  }
}
