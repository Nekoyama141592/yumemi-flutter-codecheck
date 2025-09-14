import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/core/util/route_util.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/auto_dispose/my_home/my_home_view_model.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/keep_alive/theme/theme_notifier.dart';
import 'components/header.dart';
import 'components/search_section.dart';
import 'components/loading_view.dart';
import 'components/error_view.dart';
import 'components/empty_view.dart';
import 'components/repository_list_view.dart';

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
                child: Header(
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
                child: SearchSection(
                  appColors: appColors,
                  searchController: searchController,
                  onQueryChanged: (query) async {
                    HapticFeedback.selectionClick();
                    await notifier().searchRepositories(query: query);
                  },
                  onClear: () async {
                    searchController.clear();
                  },
                ),
              ),
            ),
            Expanded(
              child: FadeTransition(
                opacity: contentFadeAnimation,
                child: state.when(
                  loading: () => LoadingView(appColors: appColors),
                  error: (error, _) =>
                      ErrorView(appColors: appColors, error: error),
                  data: (data) {
                    if (data.repositories.isEmpty) {
                      return EmptyView(appColors: appColors);
                    }
                    return RepositoryListView(
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
