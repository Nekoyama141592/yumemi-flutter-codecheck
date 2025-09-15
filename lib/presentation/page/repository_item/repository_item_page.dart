import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/auto_dispose/repository_item/repository_item_view_model.dart';
import '../../../l10n/app_localizations.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/keep_alive/theme/theme_notifier.dart';
import 'package:yumemi_flutter_codecheck/presentation/common/edit_token_dialog.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';
import 'components/loading_state.dart';
import 'components/error_state.dart';
import 'components/not_found_state.dart';
import 'components/repository_content.dart';

@RoutePage()
class RepositoryItemPage extends HookConsumerWidget {
  const RepositoryItemPage({
    super.key,
    @PathParam('userName') required this.userName,
    @PathParam('name') required this.name,
  });

  static const path = '/users/:userName/repositories/:name';

  static String generatePath({required String userName, required String name}) {
    return '/users/$userName/repositories/$name';
  }

  final String userName;
  final String name;

  Future<void> _launchGitHubUrl(String? url) async {
    if (url == null || url.isEmpty) return;

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(repositoryItemViewModelProvider(userName, name));
    final appColors = Theme.of(context).extension<AppColors>()!;
    final isDark = ref.watch(themeProvider).isDarkMode;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    final pageInset = 20.0 * scaleH;
    final tokenFuture = useMemoized(
      () => ref.read(secureStorageRepositoryProvider).getToken(),
      const [],
    );
    final tokenSnapshot = useFuture(tokenFuture);
    final hasToken = tokenSnapshot.data != null;

    // Animation controllers
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1200),
    );
    final fadeAnimationTween = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );
    final slideAnimationTween =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
          ),
        );
    final scaleAnimationTween = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.elasticOut),
      ),
    );

    // Start animation when widget builds
    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    // Restart animation when state changes
    useEffect(() {
      if (state.hasValue || state.hasError) {
        animationController.reset();
        animationController.forward();
      }
      return null;
    }, [state]);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          '$userName/$name',
          style: TextStyle(
            color: appColors.onSurface,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: appColors.surface,
        foregroundColor: appColors.onSurface,
        elevation: 0,
        centerTitle: false,
        actions: [
          // Theme toggle button
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 8 * scaleH,
            ).copyWith(right: 8 * scaleH),
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
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  key: ValueKey(isDark),
                  color: appColors.primary,
                  size: 22,
                ),
              ),
            ),
          ),
          // Token edit button
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 8 * scaleH,
            ).copyWith(right: 12 * scaleH),
            decoration: BoxDecoration(
              color: hasToken
                  ? appColors.tokenOn.withValues(alpha: 0.1)
                  : appColors.tokenOff.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: hasToken ? appColors.tokenOn : appColors.tokenOff,
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
                color: hasToken ? appColors.tokenOn : appColors.tokenOff,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final content = AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              switchInCurve: Curves.easeInOutCubic,
              switchOutCurve: Curves.easeInOutCubic,
              child: state.when(
                loading: () => FadeTransition(
                  opacity: fadeAnimationTween,
                  child: LoadingState(
                    appColors: appColors,
                    isLandscape: isLandscape,
                  ),
                ),
                error: (_, _) => SlideTransition(
                  position: slideAnimationTween,
                  child: FadeTransition(
                    opacity: fadeAnimationTween,
                    child: ErrorState(appColors: appColors),
                  ),
                ),
                data: (repo) => repo == null
                    ? SlideTransition(
                        position: slideAnimationTween,
                        child: FadeTransition(
                          opacity: fadeAnimationTween,
                          child: NotFoundState(appColors: appColors),
                        ),
                      )
                    : SlideTransition(
                        position: slideAnimationTween,
                        child: FadeTransition(
                          opacity: fadeAnimationTween,
                          child: ScaleTransition(
                            scale: scaleAnimationTween,
                            child: RepositoryContent(
                              repo: repo,
                              appColors: appColors,
                              isLandscape: isLandscape,
                              onLaunchUrl: _launchGitHubUrl,
                            ),
                          ),
                        ),
                      ),
              ),
            );

            // In landscape, vertically center the page content within viewport
            // while keeping it scrollable when necessary.
            if (isLandscape) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(pageInset),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Center(child: content),
                ),
              );
            }

            // Portrait: keep previous behavior.
            return SingleChildScrollView(
              padding: EdgeInsets.all(pageInset),
              child: content,
            );
          },
        ),
      ),
    );
  }
}
