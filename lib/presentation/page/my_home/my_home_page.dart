import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/core/util/route_util.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';
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
    final isDark = ref.watch(themeProvider).isDarkMode;

    // Animation controllers
    final headerAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 1000),
    );
    final searchAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 800),
    );
    final contentAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    // Header animations
    final headerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: headerAnimationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );
    final headerSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: headerAnimationController,
            curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
          ),
        );

    // Search section animations
    final searchFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: searchAnimationController,
        curve: Curves.easeOutCubic,
      ),
    );
    final searchSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: searchAnimationController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Content animations
    final contentFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: contentAnimationController,
        curve: Curves.easeOut,
      ),
    );

    // Start animations
    useEffect(() {
      headerAnimationController.forward();
      Future.delayed(const Duration(milliseconds: 300), () {
        searchAnimationController.forward();
      });
      Future.delayed(const Duration(milliseconds: 600), () {
        contentAnimationController.forward();
      });
      return null;
    }, []);

    // Restart content animation when state changes
    useEffect(() {
      if (state.hasValue || state.hasError) {
        contentAnimationController.reset();
        contentAnimationController.forward();
      }
      return null;
    }, [state]);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SlideTransition(
              position: headerSlideAnimation,
              child: FadeTransition(
                opacity: headerFadeAnimation,
                child: _Header(
                  isDark: isDark,
                  token: token,
                  appColors: appColors,
                  onToggleTheme: () {
                    HapticFeedback.lightImpact();
                    ref.read(themeProvider.notifier).toggleTheme();
                  },
                  onEditToken: () {
                    HapticFeedback.lightImpact();
                    EditTokenDialog.show(context);
                  },
                ),
              ),
            ),
            SlideTransition(
              position: searchSlideAnimation,
              child: FadeTransition(
                opacity: searchFadeAnimation,
                child: _SearchSection(
                  appColors: appColors,
                  searchController: searchController,
                  onQueryChanged: (query) async {
                    HapticFeedback.selectionClick();
                    await notifier().searchRepositories(query: query);
                  },
                  onClear: () async {
                    searchController.clear();
                    await notifier().searchRepositories(query: '');
                  },
                ),
              ),
            ),
            Expanded(
              child: FadeTransition(
                opacity: contentFadeAnimation,
                child: state.when(
                  loading: () => _LoadingView(appColors: appColors),
                  error: (error, _) =>
                      _ErrorView(appColors: appColors, error: error),
                  data: (data) {
                    if (data.repositories.isEmpty) {
                      return _EmptyView(appColors: appColors);
                    }
                    return _RepositoryListView(
                      appColors: appColors,
                      repositories: data.repositories,
                      onTapRepo: (repo) {
                        HapticFeedback.lightImpact();
                        RouteUtil.pushRepositoryItemPage(
                          context,
                          userName: repo.userName,
                          name: repo.name,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class _Header extends StatelessWidget {
  const _Header({
    required this.isDark,
    required this.token,
    required this.appColors,
    required this.onToggleTheme,
    required this.onEditToken,
  });

  final bool isDark;
  final String? token;
  final AppColors appColors;
  final VoidCallback onToggleTheme;
  final VoidCallback onEditToken;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20 * scaleH, 20 * scaleH, 20 * scaleH, 0),
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
                      onPressed: onToggleTheme,
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
                  SizedBox(width: 12 * scaleH),
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
                      onPressed: onEditToken,
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
          SizedBox(height: 20 * scaleH),
        ],
      ),
    );
  }
}

class _SearchSection extends StatelessWidget {
  const _SearchSection({
    required this.appColors,
    required this.searchController,
    required this.onQueryChanged,
    required this.onClear,
  });

  final AppColors appColors;
  final TextEditingController searchController;
  final Future<void> Function(String query) onQueryChanged;
  final Future<void> Function() onClear;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20 * scaleH),
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
          SizedBox(height: 12 * scaleH),
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
                  margin:
                      EdgeInsets.only(left: 16 * scaleH, right: 12 * scaleH),
                  child: Icon(
                    Icons.search_rounded,
                    color: appColors.primary,
                    size: 24,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(minWidth: 52 * scaleH),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () async {
                          await onClear();
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
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20 * scaleH,
                  vertical: 18 * scaleH,
                ),
              ),
              onChanged: onQueryChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16 * scaleH),
            decoration: BoxDecoration(
              color: appColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: CircularProgressIndicator(
              color: appColors.primary,
              strokeWidth: 3,
            ),
          ),
          SizedBox(height: 24 * scaleH),
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
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.appColors, required this.error});
  final AppColors appColors;
  final Object error;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return Container(
      padding: EdgeInsets.all(32 * scaleH),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20 * scaleH),
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
            SizedBox(height: 24 * scaleH),
            Text(
              AppLocalizations.of(context)!.repoErrorSubtitle,
              style: TextStyle(
                color: appColors.onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12 * scaleH),
            Text(
              AppLocalizations.of(context)!.repoErrorTitle,
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
}

class _EmptyView extends StatelessWidget {
  const _EmptyView({required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return Container(
      padding: EdgeInsets.all(32 * scaleH),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20 * scaleH),
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
            SizedBox(height: 24 * scaleH),
            Text(
              AppLocalizations.of(context)!.startExploring,
              style: TextStyle(
                color: appColors.onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12 * scaleH),
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
}

class _RepositoryListView extends StatelessWidget {
  const _RepositoryListView({
    required this.appColors,
    required this.repositories,
    required this.onTapRepo,
  });

  final AppColors appColors;
  final List<SearchRepositoriesItemEntity> repositories;
  final ValueChanged<SearchRepositoriesItemEntity> onTapRepo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return ListView.separated(
      padding:
          EdgeInsets.symmetric(horizontal: 20 * scaleH, vertical: 8 * scaleH),
      itemCount: repositories.length,
      separatorBuilder: (context, index) => SizedBox(height: 12 * scaleH),
      itemBuilder: (context, index) {
        final repo = repositories[index];
        return _AnimatedListItem(
          index: index,
          child: _RepositoryCard(
            appColors: appColors,
            repo: repo,
            onTap: () => onTapRepo(repo),
          ),
        );
      },
    );
  }
}

class _RepositoryCard extends StatelessWidget {
  const _RepositoryCard({
    required this.appColors,
    required this.repo,
    required this.onTap,
  });

  final AppColors appColors;
  final SearchRepositoriesItemEntity repo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
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
      child: _AnimatedCardButton(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.all(20 * scaleH),
          child: Row(
            children: [
              SizedBox(width: 12 * scaleH),
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
        ),
      ),
    );
  }
}
// Animated list item for staggered animations
class _AnimatedListItem extends HookWidget {
  const _AnimatedListItem({required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    final slideAnimation =
        Tween<Offset>(begin: const Offset(0.5, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    final scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );

    useEffect(() {
      final delay = Duration(milliseconds: (index * 100).clamp(0, 800));
      Future.delayed(delay, () {
        if (context.mounted) {
          animationController.forward();
        }
      });
      return null;
    }, []);

    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: ScaleTransition(scale: scaleAnimation, child: child),
      ),
    );
  }
}

// Animated card button with press effects
class _AnimatedCardButton extends HookWidget {
  const _AnimatedCardButton({
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
