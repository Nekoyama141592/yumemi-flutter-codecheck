import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/auto_dispose/repository_item/repository_item_view_model.dart';
import '../../../l10n/app_localizations.dart';
import 'package:yumemi_flutter_codecheck/presentation/notifier/keep_alive/theme/theme_notifier.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home/components/edit_token_dialog.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/secure_storage/secure_storage_repository_provider.dart';

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(repositoryItemViewModelProvider(userName, name));
    final appColors = Theme.of(context).extension<AppColors>()!;
    final isDark = ref.watch(themeProvider).isDarkMode;
    final tokenFuture = useMemoized(
      () => ref.read(secureStorageRepositoryProvider).getToken(),
      const [],
    );
    final tokenSnapshot = useFuture(tokenFuture);
    final hasToken = tokenSnapshot.data != null;

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
            margin: const EdgeInsets.symmetric(vertical: 8).copyWith(right: 8),
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
            margin: const EdgeInsets.symmetric(vertical: 8).copyWith(right: 12),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: state.when(
            loading: () => _buildLoadingState(appColors),
            error: (_, _) => _buildErrorState(context, appColors),
            data: (repo) => repo == null
                ? _buildNotFoundState(context, appColors)
                : _buildRepositoryContent(context, repo, appColors),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState(AppColors appColors) {
    return Column(
      children: [
        _ShimmerContainer(
          height: 120,
          width: double.infinity,
          borderRadius: BorderRadius.circular(16),
        ),
        const SizedBox(height: 20),
        _ShimmerContainer(
          height: 60,
          width: double.infinity,
          borderRadius: BorderRadius.circular(12),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _ShimmerContainer(
                height: 80,
                width: double.infinity,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _ShimmerContainer(
                height: 80,
                width: double.infinity,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, AppColors appColors) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: appColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: appColors.border, width: 1),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
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
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.repoErrorTitle,
            style: TextStyle(
              color: appColors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.repoErrorSubtitle,
            style: TextStyle(color: appColors.secondary, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNotFoundState(BuildContext context, AppColors appColors) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: appColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: appColors.border, width: 1),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: appColors.secondary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search_off_rounded,
              size: 48,
              color: appColors.secondary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.repoNotFoundTitle,
            style: TextStyle(
              color: appColors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.repoNotFoundSubtitle,
            style: TextStyle(color: appColors.secondary, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRepositoryContent(
    BuildContext context,
    GetRepositoryItemEntity repo,
    AppColors appColors,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeaderCard(context, repo, appColors),
        const SizedBox(height: 20),
        _buildStatsGrid(context, repo, appColors),
        const SizedBox(height: 20),
        _buildActionButtons(context, repo, appColors),
      ],
    );
  }

  Widget _buildHeaderCard(
    BuildContext context,
    GetRepositoryItemEntity repo,
    AppColors appColors,
  ) {
    final avatarUrl = repo.ownerAvatarUrl;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
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
      child: Column(
        children: [
          avatarUrl == null || avatarUrl.isEmpty
              ? Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: appColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 60,
                    color: appColors.primary,
                  ),
                )
              : CachedNetworkImage(
                  imageUrl: avatarUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const _ShimmerCircle(radius: 40),
                  errorWidget: (context, url, error) => Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: appColors.accent.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.error_outline_rounded,
                      size: 40,
                      color: appColors.accent,
                    ),
                  ),
                ),
          const SizedBox(height: 16),
          Text(
            repo.fullName,
            style: TextStyle(
              color: appColors.onSurface,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          if (repo.language != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: appColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: appColors.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Text(
                repo.language!,
                style: TextStyle(
                  color: appColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatsGrid(
    BuildContext context,
    GetRepositoryItemEntity repo,
    AppColors appColors,
  ) {
    final stats = [
      _StatItem(
        icon: Icons.star_rounded,
        label: AppLocalizations.of(context)!.stars,
        value: _formatNumber(repo.stargazersCount),
        color: Colors.amber,
      ),
      _StatItem(
        icon: Icons.visibility_rounded,
        label: AppLocalizations.of(context)!.watchers,
        value: _formatNumber(repo.watchersCount),
        color: Colors.blue,
      ),
      _StatItem(
        icon: Icons.fork_right_rounded,
        label: AppLocalizations.of(context)!.forks,
        value: _formatNumber(repo.forksCount),
        color: Colors.green,
      ),
      _StatItem(
        icon: Icons.bug_report_rounded,
        label: AppLocalizations.of(context)!.issues,
        value: _formatNumber(repo.openIssuesCount),
        color: Colors.red,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.4,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: appColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: appColors.border, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: stat.color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(stat.icon, color: stat.color, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                stat.value,
                style: TextStyle(
                  color: appColors.onSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                stat.label,
                style: TextStyle(
                  color: appColors.secondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    GetRepositoryItemEntity repo,
    AppColors appColors,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: appColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: appColors.border, width: 1),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _launchGitHubUrl(repo.htmlUrl),
              icon: const Icon(Icons.open_in_browser_rounded),
              label: Text(AppLocalizations.of(context)!.openInGitHub),
              style: ElevatedButton.styleFrom(
                backgroundColor: appColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }

  Future<void> _launchGitHubUrl(String? url) async {
    if (url == null || url.isEmpty) return;

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _ShimmerCircle extends StatelessWidget {
  const _ShimmerCircle({required this.radius});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CircleAvatar(radius: radius, backgroundColor: Colors.white),
    );
  }
}

class _ShimmerContainer extends StatelessWidget {
  const _ShimmerContainer({
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  final double height;
  final double width;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

class _StatItem {
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;
}
