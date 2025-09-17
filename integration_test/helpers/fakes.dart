import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/datasource/github/github_api_client.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/license_simple/license_simple.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/permission/permissions.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/repository_item/repository_item.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/search_repositories_response.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/simple_user/simple_user.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/repository/secure_storage_repository.dart';

/// Fake secure storage to avoid platform channels in tests
class FakeSecureStorageRepository extends SecureStorageRepository {
  FakeSecureStorageRepository() : super(const FlutterSecureStorage());

  String? _token;
  @override
  Future<void> saveToken(String token) async {
    _token = token;
  }

  @override
  Future<String?> getToken() async => _token;

  @override
  Future<void> deleteToken() async {
    _token = null;
  }
}

/// A lightweight fake of GitHubApiClient returning deterministic data
class FakeGitHubApiClient implements GitHubApiClient {
  FakeGitHubApiClient();

  RepositoryItem _buildRepo({
    required int id,
    required String user,
    required String name,
    required int stars,
    required int watchers,
    required int forks,
    required int issues,
    String? language,
  }) {
    final fullName = '$user/$name';
    final now = '2024-01-01T00:00:00Z';
    final apiBase = 'https://api.github.com';
    return RepositoryItem(
      id: id,
      nodeId: 'MDEwOlJlcG9zaXRvcnk$id',
      name: name,
      fullName: fullName,
      owner: SimpleUser(
        login: user,
        id: id,
        nodeId: 'MDQ6VXNlcg$id',
        // Empty to avoid CachedNetworkImage network calls in tests
        avatarUrl: '',
        url: '$apiBase/users/$user',
        htmlUrl: 'https://github.com/$user',
        followersUrl: '$apiBase/users/$user/followers',
        followingUrl: '$apiBase/users/$user/following{/other_user}',
        gistsUrl: '$apiBase/users/$user/gists{/gist_id}',
        starredUrl: '$apiBase/users/$user/starred{/owner}{/repo}',
        subscriptionsUrl: '$apiBase/users/$user/subscriptions',
        organizationsUrl: '$apiBase/users/$user/orgs',
        reposUrl: '$apiBase/users/$user/repos',
        eventsUrl: '$apiBase/users/$user/events{/privacy}',
        receivedEventsUrl: '$apiBase/users/$user/received_events',
        type: 'User',
        siteAdmin: false,
      ),
      private: false,
      htmlUrl: 'https://github.com/$fullName',
      description: 'Sample repository for $fullName',
      fork: false,
      url: '$apiBase/repos/$fullName',
      createdAt: now,
      updatedAt: now,
      pushedAt: now,
      homepage: null,
      size: 123,
      stargazersCount: stars,
      watchersCount: watchers,
      language: language,
      forksCount: forks,
      openIssuesCount: issues,
      masterBranch: null,
      defaultBranch: 'main',
      score: 1.0,
      archiveUrl: '$apiBase/repos/$fullName/{archive_format}{/ref}',
      assigneesUrl: '$apiBase/repos/$fullName/assignees{/user}',
      blobsUrl: '$apiBase/repos/$fullName/git/blobs{/sha}',
      branchesUrl: '$apiBase/repos/$fullName/branches{/branch}',
      collaboratorsUrl: '$apiBase/repos/$fullName/collaborators{/collaborator}',
      commentsUrl: '$apiBase/repos/$fullName/comments{/number}',
      commitsUrl: '$apiBase/repos/$fullName/commits{/sha}',
      compareUrl: '$apiBase/repos/$fullName/compare/{base}...{head}',
      contentsUrl: '$apiBase/repos/$fullName/contents/{+path}',
      contributorsUrl: '$apiBase/repos/$fullName/contributors',
      deploymentsUrl: '$apiBase/repos/$fullName/deployments',
      downloadsUrl: '$apiBase/repos/$fullName/downloads',
      eventsUrl: '$apiBase/repos/$fullName/events',
      forksUrl: '$apiBase/repos/$fullName/forks',
      gitCommitsUrl: '$apiBase/repos/$fullName/git/commits{/sha}',
      gitRefsUrl: '$apiBase/repos/$fullName/git/refs{/sha}',
      gitTagsUrl: '$apiBase/repos/$fullName/git/tags{/sha}',
      hooksUrl: '$apiBase/repos/$fullName/hooks',
      issueCommentUrl: '$apiBase/repos/$fullName/issues/comments{/number}',
      issueEventsUrl: '$apiBase/repos/$fullName/issues/events{/number}',
      issuesUrl: '$apiBase/repos/$fullName/issues{/number}',
      keysUrl: '$apiBase/repos/$fullName/keys{/key_id}',
      labelsUrl: '$apiBase/repos/$fullName/labels{/name}',
      languagesUrl: '$apiBase/repos/$fullName/languages',
      mergesUrl: '$apiBase/repos/$fullName/merges',
      milestonesUrl: '$apiBase/repos/$fullName/milestones{/number}',
      notificationsUrl:
          '$apiBase/repos/$fullName/notifications{?since,all,participating}',
      pullsUrl: '$apiBase/repos/$fullName/pulls{/number}',
      releasesUrl: '$apiBase/repos/$fullName/releases{/id}',
      sshUrl: 'git@github.com:$fullName.git',
      cloneUrl: 'https://github.com/$fullName.git',
      svnUrl: 'https://github.com/$fullName',
      forks: forks,
      openIssues: issues,
      watchers: watchers,
      topics: const [],
      mirrorUrl: null,
      hasIssues: true,
      hasProjects: true,
      hasPages: true,
      hasWiki: true,
      hasDownloads: true,
      hasDiscussions: true,
      archived: false,
      disabled: false,
      visibility: 'public',
      license: const LicenseSimple(
        key: 'mit',
        name: 'MIT License',
        url: 'https://opensource.org/licenses/MIT',
        spdxId: 'MIT',
        nodeId: 'MDc6TGljZW5zZTE=',
        htmlUrl: 'https://api.github.com/licenses/mit',
      ),
      permissions: const Permissions(admin: false, push: true, pull: true),
    );
  }

  @override
  Future<SearchRepositoriesResponse> searchRepositories(
    String q,
    String? sort,
    String? order,
    int? perPage,
    int? page,
  ) async {
    // Simulate minimal network delay
    await Future<void>.delayed(const Duration(milliseconds: 50));
    final normalizedQuery = q.trim().toLowerCase();

    // Detail page path-like query ("user/repo") returns a single exact match
    if (q.contains('/')) {
      final parts = q.split('/');
      final user = parts[0];
      final name = parts[1];
      final item = _buildRepo(
        id: 1000,
        user: user,
        name: name,
        stars: 4200,
        watchers: 4200,
        forks: 123,
        issues: 7,
        language: 'Dart',
      );
      return SearchRepositoriesResponse(
        totalCount: 1,
        incompleteResults: false,
        items: [item],
      );
    }

    if (normalizedQuery == 'react-native') {
      final items = <RepositoryItem>[
        _buildRepo(
          id: 2,
          user: 'facebook',
          name: 'react-native',
          stars: 112000,
          watchers: 112000,
          forks: 24000,
          issues: 900,
          language: 'TypeScript',
        ),
      ];
      return SearchRepositoriesResponse(
        totalCount: items.length,
        incompleteResults: false,
        items: items,
      );
    }

    // Home search returns two results for any keyword
    final items = <RepositoryItem>[
      _buildRepo(
        id: 1,
        user: 'flutter',
        name: 'flutter',
        stars: 10000,
        watchers: 10000,
        forks: 500,
        issues: 10,
        language: 'Dart',
      ),
    ];
    return SearchRepositoriesResponse(
      totalCount: items.length,
      incompleteResults: false,
      items: items,
    );
  }
}
