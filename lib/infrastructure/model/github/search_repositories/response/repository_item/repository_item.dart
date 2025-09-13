import 'package:freezed_annotation/freezed_annotation.dart';

import '../license_simple/license_simple.dart';
import '../permission/permissions.dart';
import '../simple_user/simple_user.dart';

part 'repository_item.freezed.dart';
part 'repository_item.g.dart';

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
  }) = _RepositoryItem;

  factory RepositoryItem.fromJson(Map<String, dynamic> json) =>
      _$RepositoryItemFromJson(json);
}

