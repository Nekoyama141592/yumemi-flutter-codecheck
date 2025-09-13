import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../l10n/app_localizations.dart';
import '../../../application/flavors.dart';
import '../../common/original_drawer.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/auto_dispose/my_home/my_home_view_model.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';

@RoutePage()
class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});
  static const path = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myHomeViewModelProvider);

    final token = state.value?.token;

    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.vpn_key,
              color: token != null
                  ? Theme.of(context).extension<AppColors>()!.tokenOn
                  : Theme.of(context).extension<AppColors>()!.tokenOff,
            ),
          ),
        ],
      ),
      drawer: const OriginalDrawer(),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: ${e.toString()}')),
        data: (data) {
          if (data.repositories.isEmpty) {
            return Center(child: Text(AppLocalizations.of(context)!.hello));
          }
          return ListView.builder(
            itemCount: data.repositories.length,
            itemBuilder: (context, index) {
              final repo = data.repositories[index];
              return ListTile(
                title: Text(repo.fullName),
                subtitle: Text(repo.htmlUrl),
              );
            },
          );
        },
      ),
    );
  }
}
