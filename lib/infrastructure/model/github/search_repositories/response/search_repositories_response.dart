import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_repositories_response.freezed.dart';
part 'search_repositories_response.g.dart';

@freezed
abstract class SearchRepositoriesResponse with _$SearchRepositoriesResponse {
  const SearchRepositoriesResponse._();
  const factory SearchRepositoriesResponse({
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'incomplete_results') required bool incompleteResults,
    required List<RepositoryItem> items,
  }) = _SearchRepositoriesResponse;

  factory SearchRepositoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoriesResponseFromJson(json);
}

@freezed
abstract class RepositoryItem with _$RepositoryItem {
  const RepositoryItem._();
  const factory RepositoryItem({
    required int id,
    @JsonKey(name: 'node_id') required String nodeId,
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required SimpleUser? owner,
    required bool private,
    @JsonKey(name: 'html_url') required String htmlUrl,
    String? description,
    required bool fork,
    required String url,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'pushed_at') required String pushedAt,
    String? homepage,
    required int size,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
    @JsonKey(name: 'watchers_count') required int watchersCount,
    String? language,
    @JsonKey(name: 'forks_count') required int forksCount,
    @JsonKey(name: 'open_issues_count') required int openIssuesCount,
    @JsonKey(name: 'master_branch') String? masterBranch,
    @JsonKey(name: 'default_branch') required String defaultBranch,
    required double score,
    @JsonKey(name: 'archive_url') required String archiveUrl,
    @JsonKey(name: 'assignees_url') required String assigneesUrl,
    @JsonKey(name: 'blobs_url') required String blobsUrl,
    @JsonKey(name: 'branches_url') required String branchesUrl,
    @JsonKey(name: 'collaborators_url') required String collaboratorsUrl,
    @JsonKey(name: 'comments_url') required String commentsUrl,
    @JsonKey(name: 'commits_url') required String commitsUrl,
    @JsonKey(name: 'compare_url') required String compareUrl,
    @JsonKey(name: 'contents_url') required String contentsUrl,
    @JsonKey(name: 'contributors_url') required String contributorsUrl,
    @JsonKey(name: 'deployments_url') required String deploymentsUrl,
    @JsonKey(name: 'downloads_url') required String downloadsUrl,
    @JsonKey(name: 'events_url') required String eventsUrl,
    @JsonKey(name: 'forks_url') required String forksUrl,
    @JsonKey(name: 'git_commits_url') required String gitCommitsUrl,
    @JsonKey(name: 'git_refs_url') required String gitRefsUrl,
    @JsonKey(name: 'git_tags_url') required String gitTagsUrl,
    @JsonKey(name: 'hooks_url') required String hooksUrl,
    @JsonKey(name: 'issue_comment_url') required String issueCommentUrl,
    @JsonKey(name: 'issue_events_url') required String issueEventsUrl,
    @JsonKey(name: 'issues_url') required String issuesUrl,
    @JsonKey(name: 'keys_url') required String keysUrl,
    @JsonKey(name: 'labels_url') required String labelsUrl,
    @JsonKey(name: 'languages_url') required String languagesUrl,
    @JsonKey(name: 'merges_url') required String mergesUrl,
    @JsonKey(name: 'milestones_url') required String milestonesUrl,
    @JsonKey(name: 'notifications_url') required String notificationsUrl,
    @JsonKey(name: 'pulls_url') required String pullsUrl,
    @JsonKey(name: 'releases_url') required String releasesUrl,
    @JsonKey(name: 'ssh_url') required String sshUrl,
    @JsonKey(name: 'clone_url') required String cloneUrl,
    @JsonKey(name: 'svn_url') required String svnUrl,
    required int forks,
    @JsonKey(name: 'open_issues') required int openIssues,
    required int watchers,
    required List<String> topics,
    @JsonKey(name: 'mirror_url') String? mirrorUrl,
    @JsonKey(name: 'has_issues') required bool hasIssues,
    @JsonKey(name: 'has_projects') required bool hasProjects,
    @JsonKey(name: 'has_pages') required bool hasPages,
    @JsonKey(name: 'has_wiki') required bool hasWiki,
    @JsonKey(name: 'has_downloads') required bool hasDownloads,
    @JsonKey(name: 'has_discussions') bool? hasDiscussions,
    required bool archived,
    required bool disabled,
    required String visibility,
    LicenseSimple? license,
    Permissions? permissions,
    // text_matches, temp_clone_token, allow_merge_commit, allow_squash_merge, allow_rebase_merge, allow_auto_merge, delete_branch_on_merge, allow_forking, is_template, web_commit_signoff_required などは省略
  }) = _RepositoryItem;

  factory RepositoryItem.fromJson(Map<String, dynamic> json) =>
      _$RepositoryItemFromJson(json);
}

@freezed
abstract class SimpleUser with _$SimpleUser {
  const SimpleUser._();
  const factory SimpleUser({
    String? name,
    String? email,
    required String login,
    required int id,
    @JsonKey(name: 'node_id') required String nodeId,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @JsonKey(name: 'gravatar_id') String? gravatarId,
    required String url,
    @JsonKey(name: 'html_url') required String htmlUrl,
    @JsonKey(name: 'followers_url') required String followersUrl,
    @JsonKey(name: 'following_url') required String followingUrl,
    @JsonKey(name: 'gists_url') required String gistsUrl,
    @JsonKey(name: 'starred_url') required String starredUrl,
    @JsonKey(name: 'subscriptions_url') required String subscriptionsUrl,
    @JsonKey(name: 'organizations_url') required String organizationsUrl,
    @JsonKey(name: 'repos_url') required String reposUrl,
    @JsonKey(name: 'events_url') required String eventsUrl,
    @JsonKey(name: 'received_events_url') required String receivedEventsUrl,
    required String type,
    @JsonKey(name: 'site_admin') required bool siteAdmin,
    @JsonKey(name: 'starred_at') String? starredAt,
    @JsonKey(name: 'user_view_type') String? userViewType,
  }) = _SimpleUser;

  factory SimpleUser.fromJson(Map<String, dynamic> json) =>
      _$SimpleUserFromJson(json);
}

@freezed
abstract class LicenseSimple with _$LicenseSimple {
  const LicenseSimple._();
  const factory LicenseSimple({
    required String key,
    required String name,
    String? url,
    String? spdxId,
    @JsonKey(name: 'node_id') required String nodeId,
    @JsonKey(name: 'html_url') String? htmlUrl,
  }) = _LicenseSimple;

  factory LicenseSimple.fromJson(Map<String, dynamic> json) =>
      _$LicenseSimpleFromJson(json);
}

@freezed
abstract class Permissions with _$Permissions {
  const Permissions._();
  const factory Permissions({
    required bool admin,
    bool? maintain,
    required bool push,
    bool? triage,
    required bool pull,
  }) = _Permissions;

  factory Permissions.fromJson(Map<String, dynamic> json) =>
      _$PermissionsFromJson(json);
}
