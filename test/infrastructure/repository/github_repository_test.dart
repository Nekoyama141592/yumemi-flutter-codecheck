import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/get_repository_item/get_repository_item_entity.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/datasource/github/github_api_client.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/repository_item/repository_item.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/search_repositories_response.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/simple_user/simple_user.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/repository/github_repository.dart';

class _CallRecord {
  _CallRecord({
    required this.q,
    this.sort,
    this.order,
    this.perPage,
    this.page,
  });

  final String q;
  final String? sort;
  final String? order;
  final int? perPage;
  final int? page;
}

class _FakeGitHubApiClient implements GitHubApiClient {
  _FakeGitHubApiClient(this._response);

  SearchRepositoriesResponse _response;
  final List<_CallRecord> calls = [];

  void setResponse(SearchRepositoriesResponse response) {
    _response = response;
  }

  @override
  Future<SearchRepositoriesResponse> searchRepositories(
    String q,
    String? sort,
    String? order,
    int? perPage,
    int? page,
  ) async {
    calls.add(
      _CallRecord(q: q, sort: sort, order: order, perPage: perPage, page: page),
    );
    return _response;
  }
}

RepositoryItem _makeItem({required String fullName, required String name}) {
  return RepositoryItem(
    id: 1,
    nodeId: 'node-1',
    name: name,
    fullName: fullName,
    owner: const SimpleUser(
      login: 'user',
      id: 1,
      nodeId: 'node-user-1',
      avatarUrl: 'https://example.com/avatar.png',
      url: 'https://api.github.com/users/user',
      htmlUrl: 'https://github.com/user',
      followersUrl: 'https://api.github.com/users/user/followers',
      followingUrl: 'https://api.github.com/users/user/following{/other_user}',
      gistsUrl: 'https://api.github.com/users/user/gists{/gist_id}',
      starredUrl: 'https://api.github.com/users/user/starred{/owner}{/repo}',
      subscriptionsUrl: 'https://api.github.com/users/user/subscriptions',
      organizationsUrl: 'https://api.github.com/users/user/orgs',
      reposUrl: 'https://api.github.com/users/user/repos',
      eventsUrl: 'https://api.github.com/users/user/events{/privacy}',
      receivedEventsUrl: 'https://api.github.com/users/user/received_events',
      type: 'User',
      siteAdmin: false,
    ),
    private: false,
    htmlUrl: 'https://github.com/$fullName',
    description: 'desc',
    fork: false,
    url: 'https://api.github.com/repos/$fullName',
    createdAt: '2020-01-01T00:00:00Z',
    updatedAt: '2020-01-02T00:00:00Z',
    pushedAt: '2020-01-03T00:00:00Z',
    homepage: null,
    size: 0,
    stargazersCount: 10,
    watchersCount: 20,
    language: 'Dart',
    forksCount: 3,
    openIssuesCount: 1,
    masterBranch: null,
    defaultBranch: 'main',
    score: 1.0,
    archiveUrl: 'https://api.github.com/repos/$fullName/{archive_format}{/ref}',
    assigneesUrl: 'https://api.github.com/repos/$fullName/assignees{/user}',
    blobsUrl: 'https://api.github.com/repos/$fullName/git/blobs{/sha}',
    branchesUrl: 'https://api.github.com/repos/$fullName/branches{/branch}',
    collaboratorsUrl:
        'https://api.github.com/repos/$fullName/collaborators{/collaborator}',
    commentsUrl: 'https://api.github.com/repos/$fullName/comments{/number}',
    commitsUrl: 'https://api.github.com/repos/$fullName/commits{/sha}',
    compareUrl:
        'https://api.github.com/repos/$fullName/compare/{base}...{head}',
    contentsUrl: 'https://api.github.com/repos/$fullName/contents/{+path}',
    contributorsUrl: 'https://api.github.com/repos/$fullName/contributors',
    deploymentsUrl: 'https://api.github.com/repos/$fullName/deployments',
    downloadsUrl: 'https://api.github.com/repos/$fullName/downloads',
    eventsUrl: 'https://api.github.com/repos/$fullName/events',
    forksUrl: 'https://api.github.com/repos/$fullName/forks',
    gitCommitsUrl: 'https://api.github.com/repos/$fullName/git/commits{/sha}',
    gitRefsUrl: 'https://api.github.com/repos/$fullName/git/refs{/sha}',
    gitTagsUrl: 'https://api.github.com/repos/$fullName/git/tags{/sha}',
    hooksUrl: 'https://api.github.com/repos/$fullName/hooks',
    issueCommentUrl:
        'https://api.github.com/repos/$fullName/issues/comments{/number}',
    issueEventsUrl:
        'https://api.github.com/repos/$fullName/issues/events{/number}',
    issuesUrl: 'https://api.github.com/repos/$fullName/issues{/number}',
    keysUrl: 'https://api.github.com/repos/$fullName/keys{/key_id}',
    labelsUrl: 'https://api.github.com/repos/$fullName/labels{/name}',
    languagesUrl: 'https://api.github.com/repos/$fullName/languages',
    mergesUrl: 'https://api.github.com/repos/$fullName/merges',
    milestonesUrl: 'https://api.github.com/repos/$fullName/milestones{/number}',
    notificationsUrl:
        'https://api.github.com/repos/$fullName/notifications{?since,all,participating}',
    pullsUrl: 'https://api.github.com/repos/$fullName/pulls{/number}',
    releasesUrl: 'https://api.github.com/repos/$fullName/releases{/id}',
    sshUrl: 'git@github.com:$fullName.git',
    cloneUrl: 'https://github.com/$fullName.git',
    svnUrl: 'https://svn.github.com/$fullName',
    forks: 3,
    openIssues: 1,
    watchers: 20,
    topics: const ['flutter', 'dart'],
    mirrorUrl: null,
    hasIssues: true,
    hasProjects: true,
    hasPages: false,
    hasWiki: true,
    hasDownloads: true,
    hasDiscussions: null,
    archived: false,
    disabled: false,
    visibility: 'public',
    license: null,
    permissions: null,
  );
}

void main() {
  group('GithubRepository', () {
    late _FakeGitHubApiClient fakeClient;
    late GithubRepository repository;

    setUp(() {
      final initialResponse = const SearchRepositoriesResponse(
        totalCount: 0,
        incompleteResults: false,
        items: [],
      );
      fakeClient = _FakeGitHubApiClient(initialResponse);
      repository = GithubRepository(fakeClient);
    });

    test('searchRepositories maps model to entity list', () async {
      final item = _makeItem(fullName: 'user1/repo1', name: 'repo1');
      fakeClient.setResponse(
        SearchRepositoriesResponse(
          totalCount: 1,
          incompleteResults: false,
          items: [item],
        ),
      );

      final result = await repository.searchRepositories(query: 'flutter');

      expect(result, hasLength(1));
      expect(result.first.fullName, 'user1/repo1');
      expect(result.first.name, 'repo1');
    });

    test('getRepository returns null when API returns empty list', () async {
      fakeClient.setResponse(
        const SearchRepositoriesResponse(
          totalCount: 0,
          incompleteResults: false,
          items: [],
        ),
      );

      final result = await repository.getRepository(
        userName: 'userX',
        name: 'repoX',
      );

      expect(result, isNull);
      expect(fakeClient.calls, hasLength(1));
      final call = fakeClient.calls.single;
      expect(call.q, 'userX/repoX');
      expect(call.perPage, 1);
      expect(call.page, 1);
      expect(call.sort, isNull);
      expect(call.order, isNull);
    });

    test('getRepository maps first item to entity', () async {
      final item = _makeItem(fullName: 'alice/sample', name: 'sample');
      fakeClient.setResponse(
        SearchRepositoriesResponse(
          totalCount: 1,
          incompleteResults: false,
          items: [item],
        ),
      );

      final result = await repository.getRepository(
        userName: 'alice',
        name: 'sample',
      );

      expect(result, isA<GetRepositoryItemEntity>());
      expect(result!.fullName, 'alice/sample');
      expect(result.htmlUrl, 'https://github.com/alice/sample');
      expect(result.language, 'Dart');
      expect(result.stargazersCount, 10);
      expect(result.watchersCount, 20);
      expect(result.forksCount, 3);
      expect(result.openIssuesCount, 1);
    });
  });
}
