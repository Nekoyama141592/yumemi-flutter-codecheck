import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/core/provider/datasource/github/github_api_client_provider.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/github/github_repository_provider.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/datasource/github/github_api_client.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/repository_item/repository_item.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/search_repositories_response.dart';

class _FakeGitHubApiClient implements GitHubApiClient {
  _FakeGitHubApiClient(this._response);

  SearchRepositoriesResponse _response;

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
    return _response;
  }
}

RepositoryItem _makeMinimalItem({
  required String fullName,
  required String name,
}) {
  // Only fields used by entity mapping are needed for this provider wiring test.
  return RepositoryItem(
    id: 1,
    nodeId: 'node',
    name: name,
    fullName: fullName,
    owner: null,
    private: false,
    htmlUrl: 'https://github.com/$fullName',
    description: null,
    fork: false,
    url: 'https://api.github.com/repos/$fullName',
    createdAt: '2020-01-01T00:00:00Z',
    updatedAt: '2020-01-02T00:00:00Z',
    pushedAt: '2020-01-03T00:00:00Z',
    homepage: null,
    size: 0,
    stargazersCount: 0,
    watchersCount: 0,
    language: null,
    forksCount: 0,
    openIssuesCount: 0,
    masterBranch: null,
    defaultBranch: 'main',
    score: 0,
    archiveUrl: '',
    assigneesUrl: '',
    blobsUrl: '',
    branchesUrl: '',
    collaboratorsUrl: '',
    commentsUrl: '',
    commitsUrl: '',
    compareUrl: '',
    contentsUrl: '',
    contributorsUrl: '',
    deploymentsUrl: '',
    downloadsUrl: '',
    eventsUrl: '',
    forksUrl: '',
    gitCommitsUrl: '',
    gitRefsUrl: '',
    gitTagsUrl: '',
    hooksUrl: '',
    issueCommentUrl: '',
    issueEventsUrl: '',
    issuesUrl: '',
    keysUrl: '',
    labelsUrl: '',
    languagesUrl: '',
    mergesUrl: '',
    milestonesUrl: '',
    notificationsUrl: '',
    pullsUrl: '',
    releasesUrl: '',
    sshUrl: '',
    cloneUrl: '',
    svnUrl: '',
    forks: 0,
    openIssues: 0,
    watchers: 0,
    topics: const [],
    mirrorUrl: null,
    hasIssues: false,
    hasProjects: false,
    hasPages: false,
    hasWiki: false,
    hasDownloads: false,
    hasDiscussions: null,
    archived: false,
    disabled: false,
    visibility: 'public',
    license: null,
    permissions: null,
  );
}

void main() {
  test('githubRepositoryProvider works with api client override', () async {
    final fakeClient = _FakeGitHubApiClient(
      SearchRepositoriesResponse(
        totalCount: 1,
        incompleteResults: false,
        items: [_makeMinimalItem(fullName: 'bob/repo', name: 'repo')],
      ),
    );

    final container = ProviderContainer(
      overrides: [
        githubApiClientProvider(token: null).overrideWithValue(fakeClient),
      ],
    );

    final repo = container.read(githubRepositoryProvider(token: null));
    final items = await repo.searchRepositories(query: 'anything');

    expect(items, hasLength(1));
    expect(items.first.fullName, 'bob/repo');
    expect(items.first.name, 'repo');
  });
}
