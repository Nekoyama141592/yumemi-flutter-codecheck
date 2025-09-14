import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/core/util/route_util.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';
import 'package:yumemi_flutter_codecheck/presentation/state/auto_dispose/my_home/my_home_state.dart';
import '../../../l10n/app_localizations.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/auto_dispose/my_home/my_home_view_model.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home/components/edit_token_dialog.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/keep_alive/theme/theme_notifier.dart';

@RoutePage()
class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});
  static const path = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyHomeViewModel notifier() => ref.read(myHomeViewModelProvider.notifier);
    final state = ref.watch(myHomeViewModelProvider);
    final token = state.value?.token;
    final searchController = useTextEditingController(text: 'flutter');
    final appColors = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, ref, appColors, token),
            _buildSearchSection(context, searchController, notifier, appColors),
            Expanded(child: _buildContent(context, state, appColors)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    WidgetRef ref,
    AppColors appColors,
    String? token,
  ) {
    final isDark = ref.watch(themeProvider).isDarkMode;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
        color: appColors.surface,
        boxShadow: [
          BoxShadow(
            color: appColors.onSurface.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GitHub',
                      style: TextStyle(
                        color: appColors.onSurface,
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.repositoryExplorer,
                      style: TextStyle(
                        color: appColors.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: appColors.cardBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: appColors.border),
                    ),
                    child: IconButton(
                      tooltip: isDark
                          ? AppLocalizations.of(context)!.themeLightTooltip
                          : AppLocalizations.of(context)!.themeDarkTooltip,
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        ref.read(themeProvider.notifier).toggleTheme();
                      },
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          isDark
                              ? Icons.light_mode_rounded
                              : Icons.dark_mode_rounded,
                          key: ValueKey(isDark),
                          color: appColors.primary,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: token != null
                          ? appColors.tokenOn.withValues(alpha: 0.1)
                          : appColors.tokenOff.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: token != null
                            ? appColors.tokenOn
                            : appColors.tokenOff,
                        width: 1.5,
                      ),
                    ),
                    child: IconButton(
                      tooltip: AppLocalizations.of(context)!.editTokenTooltip,
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        EditTokenDialog.show(context);
                      },
                      icon: Icon(
                        Icons.vpn_key_rounded,
                        color: token != null
                            ? appColors.tokenOn
                            : appColors.tokenOff,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSearchSection(
    BuildContext context,
    TextEditingController searchController,
    MyHomeViewModel Function() notifier,
    AppColors appColors,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.searchRepositories,
            style: TextStyle(
              color: appColors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: appColors.primary.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextFormField(
              controller: searchController,
              style: TextStyle(color: appColors.onSurface, fontSize: 16),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.searchFieldHint,
                hintStyle: TextStyle(color: appColors.secondary, fontSize: 15),
                prefixIcon: Container(
                  margin: const EdgeInsets.only(left: 16, right: 12),
                  child: Icon(
                    Icons.search_rounded,
                    color: appColors.primary,
                    size: 24,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 52),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          searchController.clear();
                          notifier().searchRepositories(query: '');
                        },
                        icon: Icon(
                          Icons.clear_rounded,
                          color: appColors.secondary,
                          size: 20,
                        ),
                      )
                    : null,
                filled: true,
                fillColor: appColors.cardBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: appColors.border, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: appColors.border, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: appColors.primary, width: 2),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
              ),
              onChanged: (query) async {
                HapticFeedback.selectionClick();
                await notifier().searchRepositories(query: query);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    AsyncValue<MyHomeState> state,
    AppColors appColors,
  ) {
    return state.when(
      loading: () => _buildLoadingState(context, appColors),
      error: (error, _) => _buildErrorState(context, error, appColors),
      data: (data) {
        if (data.repositories.isEmpty) {
          return _buildEmptyState(context, appColors);
        }
        return _buildRepositoryList(context, data.repositories, appColors);
      },
    );
  }

  Widget _buildLoadingState(BuildContext context, AppColors appColors) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: appColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: CircularProgressIndicator(
              color: appColors.primary,
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            AppLocalizations.of(context)!.searchingRepositories,
            style: TextStyle(
              color: appColors.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
    BuildContext context,
    Object error,
    AppColors appColors,
  ) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: appColors.accent.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: appColors.accent,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)!.somethingWentWrong,
              style: TextStyle(
                color: appColors.onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)!.error(error),
              style: TextStyle(
                color: appColors.secondary,
                fontSize: 14,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppColors appColors) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: appColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search_rounded,
                size: 48,
                color: appColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)!.startExploring,
              style: TextStyle(
                color: appColors.onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)!.startExploringSubtitle,
              style: TextStyle(
                color: appColors.secondary,
                fontSize: 14,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRepositoryList(
    BuildContext context,
    List repositories,
    AppColors appColors,
  ) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: repositories.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final repo = repositories[index];
        return _buildRepositoryCard(context, repo, appColors);
      },
    );
  }

  Widget _buildRepositoryCard(
    BuildContext context,
    SearchRepositoriesItemEntity repo,
    AppColors appColors,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: appColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: appColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: appColors.onSurface.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          RouteUtil.pushRepositoryItemPage(
            context,
            userName: repo.userName,
            name: repo.name,
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      repo.fullName,
                      style: TextStyle(
                        color: appColors.onSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: appColors.secondary,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
