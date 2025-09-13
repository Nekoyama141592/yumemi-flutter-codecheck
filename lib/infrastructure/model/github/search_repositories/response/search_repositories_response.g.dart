// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repositories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchRepositoriesResponse _$SearchRepositoriesResponseFromJson(
  Map<String, dynamic> json,
) => _SearchRepositoriesResponse(
  totalCount: (json['total_count'] as num).toInt(),
  incompleteResults: json['incomplete_results'] as bool,
  items: (json['items'] as List<dynamic>)
      .map((e) => RepositoryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SearchRepositoriesResponseToJson(
  _SearchRepositoriesResponse instance,
) => <String, dynamic>{
  'total_count': instance.totalCount,
  'incomplete_results': instance.incompleteResults,
  'items': instance.items,
};

_RepositoryItem _$RepositoryItemFromJson(Map<String, dynamic> json) =>
    _RepositoryItem(
      id: (json['id'] as num).toInt(),
      nodeId: json['node_id'] as String,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      owner: json['owner'] == null
          ? null
          : SimpleUser.fromJson(json['owner'] as Map<String, dynamic>),
      private: json['private'] as bool,
      htmlUrl: json['html_url'] as String,
      description: json['description'] as String?,
      fork: json['fork'] as bool,
      url: json['url'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      pushedAt: json['pushed_at'] as String,
      homepage: json['homepage'] as String?,
      size: (json['size'] as num).toInt(),
      stargazersCount: (json['stargazers_count'] as num).toInt(),
      watchersCount: (json['watchers_count'] as num).toInt(),
      language: json['language'] as String?,
      forksCount: (json['forks_count'] as num).toInt(),
      openIssuesCount: (json['open_issues_count'] as num).toInt(),
      masterBranch: json['master_branch'] as String?,
      defaultBranch: json['default_branch'] as String,
      score: (json['score'] as num).toDouble(),
      archiveUrl: json['archive_url'] as String,
      assigneesUrl: json['assignees_url'] as String,
      blobsUrl: json['blobs_url'] as String,
      branchesUrl: json['branches_url'] as String,
      collaboratorsUrl: json['collaborators_url'] as String,
      commentsUrl: json['comments_url'] as String,
      commitsUrl: json['commits_url'] as String,
      compareUrl: json['compare_url'] as String,
      contentsUrl: json['contents_url'] as String,
      contributorsUrl: json['contributors_url'] as String,
      deploymentsUrl: json['deployments_url'] as String,
      downloadsUrl: json['downloads_url'] as String,
      eventsUrl: json['events_url'] as String,
      forksUrl: json['forks_url'] as String,
      gitCommitsUrl: json['git_commits_url'] as String,
      gitRefsUrl: json['git_refs_url'] as String,
      gitTagsUrl: json['git_tags_url'] as String,
      hooksUrl: json['hooks_url'] as String,
      issueCommentUrl: json['issue_comment_url'] as String,
      issueEventsUrl: json['issue_events_url'] as String,
      issuesUrl: json['issues_url'] as String,
      keysUrl: json['keys_url'] as String,
      labelsUrl: json['labels_url'] as String,
      languagesUrl: json['languages_url'] as String,
      mergesUrl: json['merges_url'] as String,
      milestonesUrl: json['milestones_url'] as String,
      notificationsUrl: json['notifications_url'] as String,
      pullsUrl: json['pulls_url'] as String,
      releasesUrl: json['releases_url'] as String,
      sshUrl: json['ssh_url'] as String,
      cloneUrl: json['clone_url'] as String,
      svnUrl: json['svn_url'] as String,
      forks: (json['forks'] as num).toInt(),
      openIssues: (json['open_issues'] as num).toInt(),
      watchers: (json['watchers'] as num).toInt(),
      topics: (json['topics'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      mirrorUrl: json['mirror_url'] as String?,
      hasIssues: json['has_issues'] as bool,
      hasProjects: json['has_projects'] as bool,
      hasPages: json['has_pages'] as bool,
      hasWiki: json['has_wiki'] as bool,
      hasDownloads: json['has_downloads'] as bool,
      hasDiscussions: json['has_discussions'] as bool?,
      archived: json['archived'] as bool,
      disabled: json['disabled'] as bool,
      visibility: json['visibility'] as String,
      license: json['license'] == null
          ? null
          : LicenseSimple.fromJson(json['license'] as Map<String, dynamic>),
      permissions: json['permissions'] == null
          ? null
          : Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepositoryItemToJson(_RepositoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'name': instance.name,
      'full_name': instance.fullName,
      'owner': instance.owner,
      'private': instance.private,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'fork': instance.fork,
      'url': instance.url,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'pushed_at': instance.pushedAt,
      'homepage': instance.homepage,
      'size': instance.size,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'language': instance.language,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssuesCount,
      'master_branch': instance.masterBranch,
      'default_branch': instance.defaultBranch,
      'score': instance.score,
      'archive_url': instance.archiveUrl,
      'assignees_url': instance.assigneesUrl,
      'blobs_url': instance.blobsUrl,
      'branches_url': instance.branchesUrl,
      'collaborators_url': instance.collaboratorsUrl,
      'comments_url': instance.commentsUrl,
      'commits_url': instance.commitsUrl,
      'compare_url': instance.compareUrl,
      'contents_url': instance.contentsUrl,
      'contributors_url': instance.contributorsUrl,
      'deployments_url': instance.deploymentsUrl,
      'downloads_url': instance.downloadsUrl,
      'events_url': instance.eventsUrl,
      'forks_url': instance.forksUrl,
      'git_commits_url': instance.gitCommitsUrl,
      'git_refs_url': instance.gitRefsUrl,
      'git_tags_url': instance.gitTagsUrl,
      'hooks_url': instance.hooksUrl,
      'issue_comment_url': instance.issueCommentUrl,
      'issue_events_url': instance.issueEventsUrl,
      'issues_url': instance.issuesUrl,
      'keys_url': instance.keysUrl,
      'labels_url': instance.labelsUrl,
      'languages_url': instance.languagesUrl,
      'merges_url': instance.mergesUrl,
      'milestones_url': instance.milestonesUrl,
      'notifications_url': instance.notificationsUrl,
      'pulls_url': instance.pullsUrl,
      'releases_url': instance.releasesUrl,
      'ssh_url': instance.sshUrl,
      'clone_url': instance.cloneUrl,
      'svn_url': instance.svnUrl,
      'forks': instance.forks,
      'open_issues': instance.openIssues,
      'watchers': instance.watchers,
      'topics': instance.topics,
      'mirror_url': instance.mirrorUrl,
      'has_issues': instance.hasIssues,
      'has_projects': instance.hasProjects,
      'has_pages': instance.hasPages,
      'has_wiki': instance.hasWiki,
      'has_downloads': instance.hasDownloads,
      'has_discussions': instance.hasDiscussions,
      'archived': instance.archived,
      'disabled': instance.disabled,
      'visibility': instance.visibility,
      'license': instance.license,
      'permissions': instance.permissions,
    };

_SimpleUser _$SimpleUserFromJson(Map<String, dynamic> json) => _SimpleUser(
  name: json['name'] as String?,
  email: json['email'] as String?,
  login: json['login'] as String,
  id: (json['id'] as num).toInt(),
  nodeId: json['node_id'] as String,
  avatarUrl: json['avatar_url'] as String,
  gravatarId: json['gravatar_id'] as String?,
  url: json['url'] as String,
  htmlUrl: json['html_url'] as String,
  followersUrl: json['followers_url'] as String,
  followingUrl: json['following_url'] as String,
  gistsUrl: json['gists_url'] as String,
  starredUrl: json['starred_url'] as String,
  subscriptionsUrl: json['subscriptions_url'] as String,
  organizationsUrl: json['organizations_url'] as String,
  reposUrl: json['repos_url'] as String,
  eventsUrl: json['events_url'] as String,
  receivedEventsUrl: json['received_events_url'] as String,
  type: json['type'] as String,
  siteAdmin: json['site_admin'] as bool,
  starredAt: json['starred_at'] as String?,
  userViewType: json['user_view_type'] as String?,
);

Map<String, dynamic> _$SimpleUserToJson(_SimpleUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'gists_url': instance.gistsUrl,
      'starred_url': instance.starredUrl,
      'subscriptions_url': instance.subscriptionsUrl,
      'organizations_url': instance.organizationsUrl,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'received_events_url': instance.receivedEventsUrl,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
      'starred_at': instance.starredAt,
      'user_view_type': instance.userViewType,
    };

_LicenseSimple _$LicenseSimpleFromJson(Map<String, dynamic> json) =>
    _LicenseSimple(
      key: json['key'] as String,
      name: json['name'] as String,
      url: json['url'] as String?,
      spdxId: json['spdxId'] as String?,
      nodeId: json['node_id'] as String,
      htmlUrl: json['html_url'] as String?,
    );

Map<String, dynamic> _$LicenseSimpleToJson(_LicenseSimple instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'url': instance.url,
      'spdxId': instance.spdxId,
      'node_id': instance.nodeId,
      'html_url': instance.htmlUrl,
    };

_Permissions _$PermissionsFromJson(Map<String, dynamic> json) => _Permissions(
  admin: json['admin'] as bool,
  maintain: json['maintain'] as bool?,
  push: json['push'] as bool,
  triage: json['triage'] as bool?,
  pull: json['pull'] as bool,
);

Map<String, dynamic> _$PermissionsToJson(_Permissions instance) =>
    <String, dynamic>{
      'admin': instance.admin,
      'maintain': instance.maintain,
      'push': instance.push,
      'triage': instance.triage,
      'pull': instance.pull,
    };
