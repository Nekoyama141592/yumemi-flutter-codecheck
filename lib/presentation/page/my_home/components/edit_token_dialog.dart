import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';
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
      title: const Text('トークンを編集'),
      content: SizedBox(
        width: 400,
        child: loading.value
            ? const SizedBox(
                height: 56,
                child: Center(child: CircularProgressIndicator()),
              )
            : TextField(
                controller: controller,
                obscureText: obscure.value,
                decoration: InputDecoration(
                  labelText: 'Token',
                  hintText: 'GitHub Personal Access Token',
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
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: loading.value ? null : deleteToken,
          child: const Text('削除'),
        ),
        ElevatedButton(
          onPressed: loading.value ? null : save,
          child: const Text('保存'),
        ),
      ],
    );
  }
}
