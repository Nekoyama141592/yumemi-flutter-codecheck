// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_repositories_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchRepositoriesResponse {

@JsonKey(name: 'total_count') int get totalCount;@JsonKey(name: 'incomplete_results') bool get incompleteResults; List<RepositoryItem> get items;
/// Create a copy of SearchRepositoriesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchRepositoriesResponseCopyWith<SearchRepositoriesResponse> get copyWith => _$SearchRepositoriesResponseCopyWithImpl<SearchRepositoriesResponse>(this as SearchRepositoriesResponse, _$identity);

  /// Serializes this SearchRepositoriesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRepositoriesResponse&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.incompleteResults, incompleteResults) || other.incompleteResults == incompleteResults)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCount,incompleteResults,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'SearchRepositoriesResponse(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';
}


}

/// @nodoc
abstract mixin class $SearchRepositoriesResponseCopyWith<$Res>  {
  factory $SearchRepositoriesResponseCopyWith(SearchRepositoriesResponse value, $Res Function(SearchRepositoriesResponse) _then) = _$SearchRepositoriesResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'incomplete_results') bool incompleteResults, List<RepositoryItem> items
});




}
/// @nodoc
class _$SearchRepositoriesResponseCopyWithImpl<$Res>
    implements $SearchRepositoriesResponseCopyWith<$Res> {
  _$SearchRepositoriesResponseCopyWithImpl(this._self, this._then);

  final SearchRepositoriesResponse _self;
  final $Res Function(SearchRepositoriesResponse) _then;

/// Create a copy of SearchRepositoriesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalCount = null,Object? incompleteResults = null,Object? items = null,}) {
  return _then(_self.copyWith(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,incompleteResults: null == incompleteResults ? _self.incompleteResults : incompleteResults // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RepositoryItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchRepositoriesResponse].
extension SearchRepositoriesResponsePatterns on SearchRepositoriesResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchRepositoriesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchRepositoriesResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchRepositoriesResponse value)  $default,){
final _that = this;
switch (_that) {
case _SearchRepositoriesResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchRepositoriesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SearchRepositoriesResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'incomplete_results')  bool incompleteResults,  List<RepositoryItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchRepositoriesResponse() when $default != null:
return $default(_that.totalCount,_that.incompleteResults,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'incomplete_results')  bool incompleteResults,  List<RepositoryItem> items)  $default,) {final _that = this;
switch (_that) {
case _SearchRepositoriesResponse():
return $default(_that.totalCount,_that.incompleteResults,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'incomplete_results')  bool incompleteResults,  List<RepositoryItem> items)?  $default,) {final _that = this;
switch (_that) {
case _SearchRepositoriesResponse() when $default != null:
return $default(_that.totalCount,_that.incompleteResults,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchRepositoriesResponse extends SearchRepositoriesResponse {
  const _SearchRepositoriesResponse({@JsonKey(name: 'total_count') required this.totalCount, @JsonKey(name: 'incomplete_results') required this.incompleteResults, required final  List<RepositoryItem> items}): _items = items,super._();
  factory _SearchRepositoriesResponse.fromJson(Map<String, dynamic> json) => _$SearchRepositoriesResponseFromJson(json);

@override@JsonKey(name: 'total_count') final  int totalCount;
@override@JsonKey(name: 'incomplete_results') final  bool incompleteResults;
 final  List<RepositoryItem> _items;
@override List<RepositoryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of SearchRepositoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchRepositoriesResponseCopyWith<_SearchRepositoriesResponse> get copyWith => __$SearchRepositoriesResponseCopyWithImpl<_SearchRepositoriesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchRepositoriesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchRepositoriesResponse&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.incompleteResults, incompleteResults) || other.incompleteResults == incompleteResults)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCount,incompleteResults,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'SearchRepositoriesResponse(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';
}


}

/// @nodoc
abstract mixin class _$SearchRepositoriesResponseCopyWith<$Res> implements $SearchRepositoriesResponseCopyWith<$Res> {
  factory _$SearchRepositoriesResponseCopyWith(_SearchRepositoriesResponse value, $Res Function(_SearchRepositoriesResponse) _then) = __$SearchRepositoriesResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'incomplete_results') bool incompleteResults, List<RepositoryItem> items
});




}
/// @nodoc
class __$SearchRepositoriesResponseCopyWithImpl<$Res>
    implements _$SearchRepositoriesResponseCopyWith<$Res> {
  __$SearchRepositoriesResponseCopyWithImpl(this._self, this._then);

  final _SearchRepositoriesResponse _self;
  final $Res Function(_SearchRepositoriesResponse) _then;

/// Create a copy of SearchRepositoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalCount = null,Object? incompleteResults = null,Object? items = null,}) {
  return _then(_SearchRepositoriesResponse(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,incompleteResults: null == incompleteResults ? _self.incompleteResults : incompleteResults // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RepositoryItem>,
  ));
}


}


/// @nodoc
mixin _$RepositoryItem {

 int get id;@JsonKey(name: 'node_id') String get nodeId; String get name;@JsonKey(name: 'full_name') String get fullName; SimpleUser? get owner; bool get private;@JsonKey(name: 'html_url') String get htmlUrl; String? get description; bool get fork; String get url;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'pushed_at') String get pushedAt; String? get homepage; int get size;@JsonKey(name: 'stargazers_count') int get stargazersCount;@JsonKey(name: 'watchers_count') int get watchersCount; String? get language;@JsonKey(name: 'forks_count') int get forksCount;@JsonKey(name: 'open_issues_count') int get openIssuesCount;@JsonKey(name: 'master_branch') String? get masterBranch;@JsonKey(name: 'default_branch') String get defaultBranch; double get score;@JsonKey(name: 'archive_url') String get archiveUrl;@JsonKey(name: 'assignees_url') String get assigneesUrl;@JsonKey(name: 'blobs_url') String get blobsUrl;@JsonKey(name: 'branches_url') String get branchesUrl;@JsonKey(name: 'collaborators_url') String get collaboratorsUrl;@JsonKey(name: 'comments_url') String get commentsUrl;@JsonKey(name: 'commits_url') String get commitsUrl;@JsonKey(name: 'compare_url') String get compareUrl;@JsonKey(name: 'contents_url') String get contentsUrl;@JsonKey(name: 'contributors_url') String get contributorsUrl;@JsonKey(name: 'deployments_url') String get deploymentsUrl;@JsonKey(name: 'downloads_url') String get downloadsUrl;@JsonKey(name: 'events_url') String get eventsUrl;@JsonKey(name: 'forks_url') String get forksUrl;@JsonKey(name: 'git_commits_url') String get gitCommitsUrl;@JsonKey(name: 'git_refs_url') String get gitRefsUrl;@JsonKey(name: 'git_tags_url') String get gitTagsUrl;@JsonKey(name: 'hooks_url') String get hooksUrl;@JsonKey(name: 'issue_comment_url') String get issueCommentUrl;@JsonKey(name: 'issue_events_url') String get issueEventsUrl;@JsonKey(name: 'issues_url') String get issuesUrl;@JsonKey(name: 'keys_url') String get keysUrl;@JsonKey(name: 'labels_url') String get labelsUrl;@JsonKey(name: 'languages_url') String get languagesUrl;@JsonKey(name: 'merges_url') String get mergesUrl;@JsonKey(name: 'milestones_url') String get milestonesUrl;@JsonKey(name: 'notifications_url') String get notificationsUrl;@JsonKey(name: 'pulls_url') String get pullsUrl;@JsonKey(name: 'releases_url') String get releasesUrl;@JsonKey(name: 'ssh_url') String get sshUrl;@JsonKey(name: 'clone_url') String get cloneUrl;@JsonKey(name: 'svn_url') String get svnUrl; int get forks;@JsonKey(name: 'open_issues') int get openIssues; int get watchers; List<String> get topics;@JsonKey(name: 'mirror_url') String? get mirrorUrl;@JsonKey(name: 'has_issues') bool get hasIssues;@JsonKey(name: 'has_projects') bool get hasProjects;@JsonKey(name: 'has_pages') bool get hasPages;@JsonKey(name: 'has_wiki') bool get hasWiki;@JsonKey(name: 'has_downloads') bool get hasDownloads;@JsonKey(name: 'has_discussions') bool? get hasDiscussions; bool get archived; bool get disabled; String get visibility; LicenseSimple? get license; Permissions? get permissions;
/// Create a copy of RepositoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepositoryItemCopyWith<RepositoryItem> get copyWith => _$RepositoryItemCopyWithImpl<RepositoryItem>(this as RepositoryItem, _$identity);

  /// Serializes this RepositoryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepositoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.private, private) || other.private == private)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.fork, fork) || other.fork == fork)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.pushedAt, pushedAt) || other.pushedAt == pushedAt)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.size, size) || other.size == size)&&(identical(other.stargazersCount, stargazersCount) || other.stargazersCount == stargazersCount)&&(identical(other.watchersCount, watchersCount) || other.watchersCount == watchersCount)&&(identical(other.language, language) || other.language == language)&&(identical(other.forksCount, forksCount) || other.forksCount == forksCount)&&(identical(other.openIssuesCount, openIssuesCount) || other.openIssuesCount == openIssuesCount)&&(identical(other.masterBranch, masterBranch) || other.masterBranch == masterBranch)&&(identical(other.defaultBranch, defaultBranch) || other.defaultBranch == defaultBranch)&&(identical(other.score, score) || other.score == score)&&(identical(other.archiveUrl, archiveUrl) || other.archiveUrl == archiveUrl)&&(identical(other.assigneesUrl, assigneesUrl) || other.assigneesUrl == assigneesUrl)&&(identical(other.blobsUrl, blobsUrl) || other.blobsUrl == blobsUrl)&&(identical(other.branchesUrl, branchesUrl) || other.branchesUrl == branchesUrl)&&(identical(other.collaboratorsUrl, collaboratorsUrl) || other.collaboratorsUrl == collaboratorsUrl)&&(identical(other.commentsUrl, commentsUrl) || other.commentsUrl == commentsUrl)&&(identical(other.commitsUrl, commitsUrl) || other.commitsUrl == commitsUrl)&&(identical(other.compareUrl, compareUrl) || other.compareUrl == compareUrl)&&(identical(other.contentsUrl, contentsUrl) || other.contentsUrl == contentsUrl)&&(identical(other.contributorsUrl, contributorsUrl) || other.contributorsUrl == contributorsUrl)&&(identical(other.deploymentsUrl, deploymentsUrl) || other.deploymentsUrl == deploymentsUrl)&&(identical(other.downloadsUrl, downloadsUrl) || other.downloadsUrl == downloadsUrl)&&(identical(other.eventsUrl, eventsUrl) || other.eventsUrl == eventsUrl)&&(identical(other.forksUrl, forksUrl) || other.forksUrl == forksUrl)&&(identical(other.gitCommitsUrl, gitCommitsUrl) || other.gitCommitsUrl == gitCommitsUrl)&&(identical(other.gitRefsUrl, gitRefsUrl) || other.gitRefsUrl == gitRefsUrl)&&(identical(other.gitTagsUrl, gitTagsUrl) || other.gitTagsUrl == gitTagsUrl)&&(identical(other.hooksUrl, hooksUrl) || other.hooksUrl == hooksUrl)&&(identical(other.issueCommentUrl, issueCommentUrl) || other.issueCommentUrl == issueCommentUrl)&&(identical(other.issueEventsUrl, issueEventsUrl) || other.issueEventsUrl == issueEventsUrl)&&(identical(other.issuesUrl, issuesUrl) || other.issuesUrl == issuesUrl)&&(identical(other.keysUrl, keysUrl) || other.keysUrl == keysUrl)&&(identical(other.labelsUrl, labelsUrl) || other.labelsUrl == labelsUrl)&&(identical(other.languagesUrl, languagesUrl) || other.languagesUrl == languagesUrl)&&(identical(other.mergesUrl, mergesUrl) || other.mergesUrl == mergesUrl)&&(identical(other.milestonesUrl, milestonesUrl) || other.milestonesUrl == milestonesUrl)&&(identical(other.notificationsUrl, notificationsUrl) || other.notificationsUrl == notificationsUrl)&&(identical(other.pullsUrl, pullsUrl) || other.pullsUrl == pullsUrl)&&(identical(other.releasesUrl, releasesUrl) || other.releasesUrl == releasesUrl)&&(identical(other.sshUrl, sshUrl) || other.sshUrl == sshUrl)&&(identical(other.cloneUrl, cloneUrl) || other.cloneUrl == cloneUrl)&&(identical(other.svnUrl, svnUrl) || other.svnUrl == svnUrl)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.openIssues, openIssues) || other.openIssues == openIssues)&&(identical(other.watchers, watchers) || other.watchers == watchers)&&const DeepCollectionEquality().equals(other.topics, topics)&&(identical(other.mirrorUrl, mirrorUrl) || other.mirrorUrl == mirrorUrl)&&(identical(other.hasIssues, hasIssues) || other.hasIssues == hasIssues)&&(identical(other.hasProjects, hasProjects) || other.hasProjects == hasProjects)&&(identical(other.hasPages, hasPages) || other.hasPages == hasPages)&&(identical(other.hasWiki, hasWiki) || other.hasWiki == hasWiki)&&(identical(other.hasDownloads, hasDownloads) || other.hasDownloads == hasDownloads)&&(identical(other.hasDiscussions, hasDiscussions) || other.hasDiscussions == hasDiscussions)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.license, license) || other.license == license)&&(identical(other.permissions, permissions) || other.permissions == permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,nodeId,name,fullName,owner,private,htmlUrl,description,fork,url,createdAt,updatedAt,pushedAt,homepage,size,stargazersCount,watchersCount,language,forksCount,openIssuesCount,masterBranch,defaultBranch,score,archiveUrl,assigneesUrl,blobsUrl,branchesUrl,collaboratorsUrl,commentsUrl,commitsUrl,compareUrl,contentsUrl,contributorsUrl,deploymentsUrl,downloadsUrl,eventsUrl,forksUrl,gitCommitsUrl,gitRefsUrl,gitTagsUrl,hooksUrl,issueCommentUrl,issueEventsUrl,issuesUrl,keysUrl,labelsUrl,languagesUrl,mergesUrl,milestonesUrl,notificationsUrl,pullsUrl,releasesUrl,sshUrl,cloneUrl,svnUrl,forks,openIssues,watchers,const DeepCollectionEquality().hash(topics),mirrorUrl,hasIssues,hasProjects,hasPages,hasWiki,hasDownloads,hasDiscussions,archived,disabled,visibility,license,permissions]);

@override
String toString() {
  return 'RepositoryItem(id: $id, nodeId: $nodeId, name: $name, fullName: $fullName, owner: $owner, private: $private, htmlUrl: $htmlUrl, description: $description, fork: $fork, url: $url, createdAt: $createdAt, updatedAt: $updatedAt, pushedAt: $pushedAt, homepage: $homepage, size: $size, stargazersCount: $stargazersCount, watchersCount: $watchersCount, language: $language, forksCount: $forksCount, openIssuesCount: $openIssuesCount, masterBranch: $masterBranch, defaultBranch: $defaultBranch, score: $score, archiveUrl: $archiveUrl, assigneesUrl: $assigneesUrl, blobsUrl: $blobsUrl, branchesUrl: $branchesUrl, collaboratorsUrl: $collaboratorsUrl, commentsUrl: $commentsUrl, commitsUrl: $commitsUrl, compareUrl: $compareUrl, contentsUrl: $contentsUrl, contributorsUrl: $contributorsUrl, deploymentsUrl: $deploymentsUrl, downloadsUrl: $downloadsUrl, eventsUrl: $eventsUrl, forksUrl: $forksUrl, gitCommitsUrl: $gitCommitsUrl, gitRefsUrl: $gitRefsUrl, gitTagsUrl: $gitTagsUrl, hooksUrl: $hooksUrl, issueCommentUrl: $issueCommentUrl, issueEventsUrl: $issueEventsUrl, issuesUrl: $issuesUrl, keysUrl: $keysUrl, labelsUrl: $labelsUrl, languagesUrl: $languagesUrl, mergesUrl: $mergesUrl, milestonesUrl: $milestonesUrl, notificationsUrl: $notificationsUrl, pullsUrl: $pullsUrl, releasesUrl: $releasesUrl, sshUrl: $sshUrl, cloneUrl: $cloneUrl, svnUrl: $svnUrl, forks: $forks, openIssues: $openIssues, watchers: $watchers, topics: $topics, mirrorUrl: $mirrorUrl, hasIssues: $hasIssues, hasProjects: $hasProjects, hasPages: $hasPages, hasWiki: $hasWiki, hasDownloads: $hasDownloads, hasDiscussions: $hasDiscussions, archived: $archived, disabled: $disabled, visibility: $visibility, license: $license, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $RepositoryItemCopyWith<$Res>  {
  factory $RepositoryItemCopyWith(RepositoryItem value, $Res Function(RepositoryItem) _then) = _$RepositoryItemCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'node_id') String nodeId, String name,@JsonKey(name: 'full_name') String fullName, SimpleUser? owner, bool private,@JsonKey(name: 'html_url') String htmlUrl, String? description, bool fork, String url,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'pushed_at') String pushedAt, String? homepage, int size,@JsonKey(name: 'stargazers_count') int stargazersCount,@JsonKey(name: 'watchers_count') int watchersCount, String? language,@JsonKey(name: 'forks_count') int forksCount,@JsonKey(name: 'open_issues_count') int openIssuesCount,@JsonKey(name: 'master_branch') String? masterBranch,@JsonKey(name: 'default_branch') String defaultBranch, double score,@JsonKey(name: 'archive_url') String archiveUrl,@JsonKey(name: 'assignees_url') String assigneesUrl,@JsonKey(name: 'blobs_url') String blobsUrl,@JsonKey(name: 'branches_url') String branchesUrl,@JsonKey(name: 'collaborators_url') String collaboratorsUrl,@JsonKey(name: 'comments_url') String commentsUrl,@JsonKey(name: 'commits_url') String commitsUrl,@JsonKey(name: 'compare_url') String compareUrl,@JsonKey(name: 'contents_url') String contentsUrl,@JsonKey(name: 'contributors_url') String contributorsUrl,@JsonKey(name: 'deployments_url') String deploymentsUrl,@JsonKey(name: 'downloads_url') String downloadsUrl,@JsonKey(name: 'events_url') String eventsUrl,@JsonKey(name: 'forks_url') String forksUrl,@JsonKey(name: 'git_commits_url') String gitCommitsUrl,@JsonKey(name: 'git_refs_url') String gitRefsUrl,@JsonKey(name: 'git_tags_url') String gitTagsUrl,@JsonKey(name: 'hooks_url') String hooksUrl,@JsonKey(name: 'issue_comment_url') String issueCommentUrl,@JsonKey(name: 'issue_events_url') String issueEventsUrl,@JsonKey(name: 'issues_url') String issuesUrl,@JsonKey(name: 'keys_url') String keysUrl,@JsonKey(name: 'labels_url') String labelsUrl,@JsonKey(name: 'languages_url') String languagesUrl,@JsonKey(name: 'merges_url') String mergesUrl,@JsonKey(name: 'milestones_url') String milestonesUrl,@JsonKey(name: 'notifications_url') String notificationsUrl,@JsonKey(name: 'pulls_url') String pullsUrl,@JsonKey(name: 'releases_url') String releasesUrl,@JsonKey(name: 'ssh_url') String sshUrl,@JsonKey(name: 'clone_url') String cloneUrl,@JsonKey(name: 'svn_url') String svnUrl, int forks,@JsonKey(name: 'open_issues') int openIssues, int watchers, List<String> topics,@JsonKey(name: 'mirror_url') String? mirrorUrl,@JsonKey(name: 'has_issues') bool hasIssues,@JsonKey(name: 'has_projects') bool hasProjects,@JsonKey(name: 'has_pages') bool hasPages,@JsonKey(name: 'has_wiki') bool hasWiki,@JsonKey(name: 'has_downloads') bool hasDownloads,@JsonKey(name: 'has_discussions') bool? hasDiscussions, bool archived, bool disabled, String visibility, LicenseSimple? license, Permissions? permissions
});


$SimpleUserCopyWith<$Res>? get owner;$LicenseSimpleCopyWith<$Res>? get license;$PermissionsCopyWith<$Res>? get permissions;

}
/// @nodoc
class _$RepositoryItemCopyWithImpl<$Res>
    implements $RepositoryItemCopyWith<$Res> {
  _$RepositoryItemCopyWithImpl(this._self, this._then);

  final RepositoryItem _self;
  final $Res Function(RepositoryItem) _then;

/// Create a copy of RepositoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nodeId = null,Object? name = null,Object? fullName = null,Object? owner = freezed,Object? private = null,Object? htmlUrl = null,Object? description = freezed,Object? fork = null,Object? url = null,Object? createdAt = null,Object? updatedAt = null,Object? pushedAt = null,Object? homepage = freezed,Object? size = null,Object? stargazersCount = null,Object? watchersCount = null,Object? language = freezed,Object? forksCount = null,Object? openIssuesCount = null,Object? masterBranch = freezed,Object? defaultBranch = null,Object? score = null,Object? archiveUrl = null,Object? assigneesUrl = null,Object? blobsUrl = null,Object? branchesUrl = null,Object? collaboratorsUrl = null,Object? commentsUrl = null,Object? commitsUrl = null,Object? compareUrl = null,Object? contentsUrl = null,Object? contributorsUrl = null,Object? deploymentsUrl = null,Object? downloadsUrl = null,Object? eventsUrl = null,Object? forksUrl = null,Object? gitCommitsUrl = null,Object? gitRefsUrl = null,Object? gitTagsUrl = null,Object? hooksUrl = null,Object? issueCommentUrl = null,Object? issueEventsUrl = null,Object? issuesUrl = null,Object? keysUrl = null,Object? labelsUrl = null,Object? languagesUrl = null,Object? mergesUrl = null,Object? milestonesUrl = null,Object? notificationsUrl = null,Object? pullsUrl = null,Object? releasesUrl = null,Object? sshUrl = null,Object? cloneUrl = null,Object? svnUrl = null,Object? forks = null,Object? openIssues = null,Object? watchers = null,Object? topics = null,Object? mirrorUrl = freezed,Object? hasIssues = null,Object? hasProjects = null,Object? hasPages = null,Object? hasWiki = null,Object? hasDownloads = null,Object? hasDiscussions = freezed,Object? archived = null,Object? disabled = null,Object? visibility = null,Object? license = freezed,Object? permissions = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as SimpleUser?,private: null == private ? _self.private : private // ignore: cast_nullable_to_non_nullable
as bool,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,fork: null == fork ? _self.fork : fork // ignore: cast_nullable_to_non_nullable
as bool,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,pushedAt: null == pushedAt ? _self.pushedAt : pushedAt // ignore: cast_nullable_to_non_nullable
as String,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,stargazersCount: null == stargazersCount ? _self.stargazersCount : stargazersCount // ignore: cast_nullable_to_non_nullable
as int,watchersCount: null == watchersCount ? _self.watchersCount : watchersCount // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,forksCount: null == forksCount ? _self.forksCount : forksCount // ignore: cast_nullable_to_non_nullable
as int,openIssuesCount: null == openIssuesCount ? _self.openIssuesCount : openIssuesCount // ignore: cast_nullable_to_non_nullable
as int,masterBranch: freezed == masterBranch ? _self.masterBranch : masterBranch // ignore: cast_nullable_to_non_nullable
as String?,defaultBranch: null == defaultBranch ? _self.defaultBranch : defaultBranch // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,archiveUrl: null == archiveUrl ? _self.archiveUrl : archiveUrl // ignore: cast_nullable_to_non_nullable
as String,assigneesUrl: null == assigneesUrl ? _self.assigneesUrl : assigneesUrl // ignore: cast_nullable_to_non_nullable
as String,blobsUrl: null == blobsUrl ? _self.blobsUrl : blobsUrl // ignore: cast_nullable_to_non_nullable
as String,branchesUrl: null == branchesUrl ? _self.branchesUrl : branchesUrl // ignore: cast_nullable_to_non_nullable
as String,collaboratorsUrl: null == collaboratorsUrl ? _self.collaboratorsUrl : collaboratorsUrl // ignore: cast_nullable_to_non_nullable
as String,commentsUrl: null == commentsUrl ? _self.commentsUrl : commentsUrl // ignore: cast_nullable_to_non_nullable
as String,commitsUrl: null == commitsUrl ? _self.commitsUrl : commitsUrl // ignore: cast_nullable_to_non_nullable
as String,compareUrl: null == compareUrl ? _self.compareUrl : compareUrl // ignore: cast_nullable_to_non_nullable
as String,contentsUrl: null == contentsUrl ? _self.contentsUrl : contentsUrl // ignore: cast_nullable_to_non_nullable
as String,contributorsUrl: null == contributorsUrl ? _self.contributorsUrl : contributorsUrl // ignore: cast_nullable_to_non_nullable
as String,deploymentsUrl: null == deploymentsUrl ? _self.deploymentsUrl : deploymentsUrl // ignore: cast_nullable_to_non_nullable
as String,downloadsUrl: null == downloadsUrl ? _self.downloadsUrl : downloadsUrl // ignore: cast_nullable_to_non_nullable
as String,eventsUrl: null == eventsUrl ? _self.eventsUrl : eventsUrl // ignore: cast_nullable_to_non_nullable
as String,forksUrl: null == forksUrl ? _self.forksUrl : forksUrl // ignore: cast_nullable_to_non_nullable
as String,gitCommitsUrl: null == gitCommitsUrl ? _self.gitCommitsUrl : gitCommitsUrl // ignore: cast_nullable_to_non_nullable
as String,gitRefsUrl: null == gitRefsUrl ? _self.gitRefsUrl : gitRefsUrl // ignore: cast_nullable_to_non_nullable
as String,gitTagsUrl: null == gitTagsUrl ? _self.gitTagsUrl : gitTagsUrl // ignore: cast_nullable_to_non_nullable
as String,hooksUrl: null == hooksUrl ? _self.hooksUrl : hooksUrl // ignore: cast_nullable_to_non_nullable
as String,issueCommentUrl: null == issueCommentUrl ? _self.issueCommentUrl : issueCommentUrl // ignore: cast_nullable_to_non_nullable
as String,issueEventsUrl: null == issueEventsUrl ? _self.issueEventsUrl : issueEventsUrl // ignore: cast_nullable_to_non_nullable
as String,issuesUrl: null == issuesUrl ? _self.issuesUrl : issuesUrl // ignore: cast_nullable_to_non_nullable
as String,keysUrl: null == keysUrl ? _self.keysUrl : keysUrl // ignore: cast_nullable_to_non_nullable
as String,labelsUrl: null == labelsUrl ? _self.labelsUrl : labelsUrl // ignore: cast_nullable_to_non_nullable
as String,languagesUrl: null == languagesUrl ? _self.languagesUrl : languagesUrl // ignore: cast_nullable_to_non_nullable
as String,mergesUrl: null == mergesUrl ? _self.mergesUrl : mergesUrl // ignore: cast_nullable_to_non_nullable
as String,milestonesUrl: null == milestonesUrl ? _self.milestonesUrl : milestonesUrl // ignore: cast_nullable_to_non_nullable
as String,notificationsUrl: null == notificationsUrl ? _self.notificationsUrl : notificationsUrl // ignore: cast_nullable_to_non_nullable
as String,pullsUrl: null == pullsUrl ? _self.pullsUrl : pullsUrl // ignore: cast_nullable_to_non_nullable
as String,releasesUrl: null == releasesUrl ? _self.releasesUrl : releasesUrl // ignore: cast_nullable_to_non_nullable
as String,sshUrl: null == sshUrl ? _self.sshUrl : sshUrl // ignore: cast_nullable_to_non_nullable
as String,cloneUrl: null == cloneUrl ? _self.cloneUrl : cloneUrl // ignore: cast_nullable_to_non_nullable
as String,svnUrl: null == svnUrl ? _self.svnUrl : svnUrl // ignore: cast_nullable_to_non_nullable
as String,forks: null == forks ? _self.forks : forks // ignore: cast_nullable_to_non_nullable
as int,openIssues: null == openIssues ? _self.openIssues : openIssues // ignore: cast_nullable_to_non_nullable
as int,watchers: null == watchers ? _self.watchers : watchers // ignore: cast_nullable_to_non_nullable
as int,topics: null == topics ? _self.topics : topics // ignore: cast_nullable_to_non_nullable
as List<String>,mirrorUrl: freezed == mirrorUrl ? _self.mirrorUrl : mirrorUrl // ignore: cast_nullable_to_non_nullable
as String?,hasIssues: null == hasIssues ? _self.hasIssues : hasIssues // ignore: cast_nullable_to_non_nullable
as bool,hasProjects: null == hasProjects ? _self.hasProjects : hasProjects // ignore: cast_nullable_to_non_nullable
as bool,hasPages: null == hasPages ? _self.hasPages : hasPages // ignore: cast_nullable_to_non_nullable
as bool,hasWiki: null == hasWiki ? _self.hasWiki : hasWiki // ignore: cast_nullable_to_non_nullable
as bool,hasDownloads: null == hasDownloads ? _self.hasDownloads : hasDownloads // ignore: cast_nullable_to_non_nullable
as bool,hasDiscussions: freezed == hasDiscussions ? _self.hasDiscussions : hasDiscussions // ignore: cast_nullable_to_non_nullable
as bool?,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as String,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as LicenseSimple?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Permissions?,
  ));
}
/// Create a copy of RepositoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SimpleUserCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $SimpleUserCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of RepositoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LicenseSimpleCopyWith<$Res>? get license {
    if (_self.license == null) {
    return null;
  }

  return $LicenseSimpleCopyWith<$Res>(_self.license!, (value) {
    return _then(_self.copyWith(license: value));
  });
}/// Create a copy of RepositoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PermissionsCopyWith<$Res>? get permissions {
    if (_self.permissions == null) {
    return null;
  }

  return $PermissionsCopyWith<$Res>(_self.permissions!, (value) {
    return _then(_self.copyWith(permissions: value));
  });
}
}


/// Adds pattern-matching-related methods to [RepositoryItem].
extension RepositoryItemPatterns on RepositoryItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RepositoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RepositoryItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RepositoryItem value)  $default,){
final _that = this;
switch (_that) {
case _RepositoryItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RepositoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _RepositoryItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'node_id')  String nodeId,  String name, @JsonKey(name: 'full_name')  String fullName,  SimpleUser? owner,  bool private, @JsonKey(name: 'html_url')  String htmlUrl,  String? description,  bool fork,  String url, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'pushed_at')  String pushedAt,  String? homepage,  int size, @JsonKey(name: 'stargazers_count')  int stargazersCount, @JsonKey(name: 'watchers_count')  int watchersCount,  String? language, @JsonKey(name: 'forks_count')  int forksCount, @JsonKey(name: 'open_issues_count')  int openIssuesCount, @JsonKey(name: 'master_branch')  String? masterBranch, @JsonKey(name: 'default_branch')  String defaultBranch,  double score, @JsonKey(name: 'archive_url')  String archiveUrl, @JsonKey(name: 'assignees_url')  String assigneesUrl, @JsonKey(name: 'blobs_url')  String blobsUrl, @JsonKey(name: 'branches_url')  String branchesUrl, @JsonKey(name: 'collaborators_url')  String collaboratorsUrl, @JsonKey(name: 'comments_url')  String commentsUrl, @JsonKey(name: 'commits_url')  String commitsUrl, @JsonKey(name: 'compare_url')  String compareUrl, @JsonKey(name: 'contents_url')  String contentsUrl, @JsonKey(name: 'contributors_url')  String contributorsUrl, @JsonKey(name: 'deployments_url')  String deploymentsUrl, @JsonKey(name: 'downloads_url')  String downloadsUrl, @JsonKey(name: 'events_url')  String eventsUrl, @JsonKey(name: 'forks_url')  String forksUrl, @JsonKey(name: 'git_commits_url')  String gitCommitsUrl, @JsonKey(name: 'git_refs_url')  String gitRefsUrl, @JsonKey(name: 'git_tags_url')  String gitTagsUrl, @JsonKey(name: 'hooks_url')  String hooksUrl, @JsonKey(name: 'issue_comment_url')  String issueCommentUrl, @JsonKey(name: 'issue_events_url')  String issueEventsUrl, @JsonKey(name: 'issues_url')  String issuesUrl, @JsonKey(name: 'keys_url')  String keysUrl, @JsonKey(name: 'labels_url')  String labelsUrl, @JsonKey(name: 'languages_url')  String languagesUrl, @JsonKey(name: 'merges_url')  String mergesUrl, @JsonKey(name: 'milestones_url')  String milestonesUrl, @JsonKey(name: 'notifications_url')  String notificationsUrl, @JsonKey(name: 'pulls_url')  String pullsUrl, @JsonKey(name: 'releases_url')  String releasesUrl, @JsonKey(name: 'ssh_url')  String sshUrl, @JsonKey(name: 'clone_url')  String cloneUrl, @JsonKey(name: 'svn_url')  String svnUrl,  int forks, @JsonKey(name: 'open_issues')  int openIssues,  int watchers,  List<String> topics, @JsonKey(name: 'mirror_url')  String? mirrorUrl, @JsonKey(name: 'has_issues')  bool hasIssues, @JsonKey(name: 'has_projects')  bool hasProjects, @JsonKey(name: 'has_pages')  bool hasPages, @JsonKey(name: 'has_wiki')  bool hasWiki, @JsonKey(name: 'has_downloads')  bool hasDownloads, @JsonKey(name: 'has_discussions')  bool? hasDiscussions,  bool archived,  bool disabled,  String visibility,  LicenseSimple? license,  Permissions? permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RepositoryItem() when $default != null:
return $default(_that.id,_that.nodeId,_that.name,_that.fullName,_that.owner,_that.private,_that.htmlUrl,_that.description,_that.fork,_that.url,_that.createdAt,_that.updatedAt,_that.pushedAt,_that.homepage,_that.size,_that.stargazersCount,_that.watchersCount,_that.language,_that.forksCount,_that.openIssuesCount,_that.masterBranch,_that.defaultBranch,_that.score,_that.archiveUrl,_that.assigneesUrl,_that.blobsUrl,_that.branchesUrl,_that.collaboratorsUrl,_that.commentsUrl,_that.commitsUrl,_that.compareUrl,_that.contentsUrl,_that.contributorsUrl,_that.deploymentsUrl,_that.downloadsUrl,_that.eventsUrl,_that.forksUrl,_that.gitCommitsUrl,_that.gitRefsUrl,_that.gitTagsUrl,_that.hooksUrl,_that.issueCommentUrl,_that.issueEventsUrl,_that.issuesUrl,_that.keysUrl,_that.labelsUrl,_that.languagesUrl,_that.mergesUrl,_that.milestonesUrl,_that.notificationsUrl,_that.pullsUrl,_that.releasesUrl,_that.sshUrl,_that.cloneUrl,_that.svnUrl,_that.forks,_that.openIssues,_that.watchers,_that.topics,_that.mirrorUrl,_that.hasIssues,_that.hasProjects,_that.hasPages,_that.hasWiki,_that.hasDownloads,_that.hasDiscussions,_that.archived,_that.disabled,_that.visibility,_that.license,_that.permissions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'node_id')  String nodeId,  String name, @JsonKey(name: 'full_name')  String fullName,  SimpleUser? owner,  bool private, @JsonKey(name: 'html_url')  String htmlUrl,  String? description,  bool fork,  String url, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'pushed_at')  String pushedAt,  String? homepage,  int size, @JsonKey(name: 'stargazers_count')  int stargazersCount, @JsonKey(name: 'watchers_count')  int watchersCount,  String? language, @JsonKey(name: 'forks_count')  int forksCount, @JsonKey(name: 'open_issues_count')  int openIssuesCount, @JsonKey(name: 'master_branch')  String? masterBranch, @JsonKey(name: 'default_branch')  String defaultBranch,  double score, @JsonKey(name: 'archive_url')  String archiveUrl, @JsonKey(name: 'assignees_url')  String assigneesUrl, @JsonKey(name: 'blobs_url')  String blobsUrl, @JsonKey(name: 'branches_url')  String branchesUrl, @JsonKey(name: 'collaborators_url')  String collaboratorsUrl, @JsonKey(name: 'comments_url')  String commentsUrl, @JsonKey(name: 'commits_url')  String commitsUrl, @JsonKey(name: 'compare_url')  String compareUrl, @JsonKey(name: 'contents_url')  String contentsUrl, @JsonKey(name: 'contributors_url')  String contributorsUrl, @JsonKey(name: 'deployments_url')  String deploymentsUrl, @JsonKey(name: 'downloads_url')  String downloadsUrl, @JsonKey(name: 'events_url')  String eventsUrl, @JsonKey(name: 'forks_url')  String forksUrl, @JsonKey(name: 'git_commits_url')  String gitCommitsUrl, @JsonKey(name: 'git_refs_url')  String gitRefsUrl, @JsonKey(name: 'git_tags_url')  String gitTagsUrl, @JsonKey(name: 'hooks_url')  String hooksUrl, @JsonKey(name: 'issue_comment_url')  String issueCommentUrl, @JsonKey(name: 'issue_events_url')  String issueEventsUrl, @JsonKey(name: 'issues_url')  String issuesUrl, @JsonKey(name: 'keys_url')  String keysUrl, @JsonKey(name: 'labels_url')  String labelsUrl, @JsonKey(name: 'languages_url')  String languagesUrl, @JsonKey(name: 'merges_url')  String mergesUrl, @JsonKey(name: 'milestones_url')  String milestonesUrl, @JsonKey(name: 'notifications_url')  String notificationsUrl, @JsonKey(name: 'pulls_url')  String pullsUrl, @JsonKey(name: 'releases_url')  String releasesUrl, @JsonKey(name: 'ssh_url')  String sshUrl, @JsonKey(name: 'clone_url')  String cloneUrl, @JsonKey(name: 'svn_url')  String svnUrl,  int forks, @JsonKey(name: 'open_issues')  int openIssues,  int watchers,  List<String> topics, @JsonKey(name: 'mirror_url')  String? mirrorUrl, @JsonKey(name: 'has_issues')  bool hasIssues, @JsonKey(name: 'has_projects')  bool hasProjects, @JsonKey(name: 'has_pages')  bool hasPages, @JsonKey(name: 'has_wiki')  bool hasWiki, @JsonKey(name: 'has_downloads')  bool hasDownloads, @JsonKey(name: 'has_discussions')  bool? hasDiscussions,  bool archived,  bool disabled,  String visibility,  LicenseSimple? license,  Permissions? permissions)  $default,) {final _that = this;
switch (_that) {
case _RepositoryItem():
return $default(_that.id,_that.nodeId,_that.name,_that.fullName,_that.owner,_that.private,_that.htmlUrl,_that.description,_that.fork,_that.url,_that.createdAt,_that.updatedAt,_that.pushedAt,_that.homepage,_that.size,_that.stargazersCount,_that.watchersCount,_that.language,_that.forksCount,_that.openIssuesCount,_that.masterBranch,_that.defaultBranch,_that.score,_that.archiveUrl,_that.assigneesUrl,_that.blobsUrl,_that.branchesUrl,_that.collaboratorsUrl,_that.commentsUrl,_that.commitsUrl,_that.compareUrl,_that.contentsUrl,_that.contributorsUrl,_that.deploymentsUrl,_that.downloadsUrl,_that.eventsUrl,_that.forksUrl,_that.gitCommitsUrl,_that.gitRefsUrl,_that.gitTagsUrl,_that.hooksUrl,_that.issueCommentUrl,_that.issueEventsUrl,_that.issuesUrl,_that.keysUrl,_that.labelsUrl,_that.languagesUrl,_that.mergesUrl,_that.milestonesUrl,_that.notificationsUrl,_that.pullsUrl,_that.releasesUrl,_that.sshUrl,_that.cloneUrl,_that.svnUrl,_that.forks,_that.openIssues,_that.watchers,_that.topics,_that.mirrorUrl,_that.hasIssues,_that.hasProjects,_that.hasPages,_that.hasWiki,_that.hasDownloads,_that.hasDiscussions,_that.archived,_that.disabled,_that.visibility,_that.license,_that.permissions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'node_id')  String nodeId,  String name, @JsonKey(name: 'full_name')  String fullName,  SimpleUser? owner,  bool private, @JsonKey(name: 'html_url')  String htmlUrl,  String? description,  bool fork,  String url, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'pushed_at')  String pushedAt,  String? homepage,  int size, @JsonKey(name: 'stargazers_count')  int stargazersCount, @JsonKey(name: 'watchers_count')  int watchersCount,  String? language, @JsonKey(name: 'forks_count')  int forksCount, @JsonKey(name: 'open_issues_count')  int openIssuesCount, @JsonKey(name: 'master_branch')  String? masterBranch, @JsonKey(name: 'default_branch')  String defaultBranch,  double score, @JsonKey(name: 'archive_url')  String archiveUrl, @JsonKey(name: 'assignees_url')  String assigneesUrl, @JsonKey(name: 'blobs_url')  String blobsUrl, @JsonKey(name: 'branches_url')  String branchesUrl, @JsonKey(name: 'collaborators_url')  String collaboratorsUrl, @JsonKey(name: 'comments_url')  String commentsUrl, @JsonKey(name: 'commits_url')  String commitsUrl, @JsonKey(name: 'compare_url')  String compareUrl, @JsonKey(name: 'contents_url')  String contentsUrl, @JsonKey(name: 'contributors_url')  String contributorsUrl, @JsonKey(name: 'deployments_url')  String deploymentsUrl, @JsonKey(name: 'downloads_url')  String downloadsUrl, @JsonKey(name: 'events_url')  String eventsUrl, @JsonKey(name: 'forks_url')  String forksUrl, @JsonKey(name: 'git_commits_url')  String gitCommitsUrl, @JsonKey(name: 'git_refs_url')  String gitRefsUrl, @JsonKey(name: 'git_tags_url')  String gitTagsUrl, @JsonKey(name: 'hooks_url')  String hooksUrl, @JsonKey(name: 'issue_comment_url')  String issueCommentUrl, @JsonKey(name: 'issue_events_url')  String issueEventsUrl, @JsonKey(name: 'issues_url')  String issuesUrl, @JsonKey(name: 'keys_url')  String keysUrl, @JsonKey(name: 'labels_url')  String labelsUrl, @JsonKey(name: 'languages_url')  String languagesUrl, @JsonKey(name: 'merges_url')  String mergesUrl, @JsonKey(name: 'milestones_url')  String milestonesUrl, @JsonKey(name: 'notifications_url')  String notificationsUrl, @JsonKey(name: 'pulls_url')  String pullsUrl, @JsonKey(name: 'releases_url')  String releasesUrl, @JsonKey(name: 'ssh_url')  String sshUrl, @JsonKey(name: 'clone_url')  String cloneUrl, @JsonKey(name: 'svn_url')  String svnUrl,  int forks, @JsonKey(name: 'open_issues')  int openIssues,  int watchers,  List<String> topics, @JsonKey(name: 'mirror_url')  String? mirrorUrl, @JsonKey(name: 'has_issues')  bool hasIssues, @JsonKey(name: 'has_projects')  bool hasProjects, @JsonKey(name: 'has_pages')  bool hasPages, @JsonKey(name: 'has_wiki')  bool hasWiki, @JsonKey(name: 'has_downloads')  bool hasDownloads, @JsonKey(name: 'has_discussions')  bool? hasDiscussions,  bool archived,  bool disabled,  String visibility,  LicenseSimple? license,  Permissions? permissions)?  $default,) {final _that = this;
switch (_that) {
case _RepositoryItem() when $default != null:
return $default(_that.id,_that.nodeId,_that.name,_that.fullName,_that.owner,_that.private,_that.htmlUrl,_that.description,_that.fork,_that.url,_that.createdAt,_that.updatedAt,_that.pushedAt,_that.homepage,_that.size,_that.stargazersCount,_that.watchersCount,_that.language,_that.forksCount,_that.openIssuesCount,_that.masterBranch,_that.defaultBranch,_that.score,_that.archiveUrl,_that.assigneesUrl,_that.blobsUrl,_that.branchesUrl,_that.collaboratorsUrl,_that.commentsUrl,_that.commitsUrl,_that.compareUrl,_that.contentsUrl,_that.contributorsUrl,_that.deploymentsUrl,_that.downloadsUrl,_that.eventsUrl,_that.forksUrl,_that.gitCommitsUrl,_that.gitRefsUrl,_that.gitTagsUrl,_that.hooksUrl,_that.issueCommentUrl,_that.issueEventsUrl,_that.issuesUrl,_that.keysUrl,_that.labelsUrl,_that.languagesUrl,_that.mergesUrl,_that.milestonesUrl,_that.notificationsUrl,_that.pullsUrl,_that.releasesUrl,_that.sshUrl,_that.cloneUrl,_that.svnUrl,_that.forks,_that.openIssues,_that.watchers,_that.topics,_that.mirrorUrl,_that.hasIssues,_that.hasProjects,_that.hasPages,_that.hasWiki,_that.hasDownloads,_that.hasDiscussions,_that.archived,_that.disabled,_that.visibility,_that.license,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RepositoryItem extends RepositoryItem {
  const _RepositoryItem({required this.id, @JsonKey(name: 'node_id') required this.nodeId, required this.name, @JsonKey(name: 'full_name') required this.fullName, required this.owner, required this.private, @JsonKey(name: 'html_url') required this.htmlUrl, this.description, required this.fork, required this.url, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'pushed_at') required this.pushedAt, this.homepage, required this.size, @JsonKey(name: 'stargazers_count') required this.stargazersCount, @JsonKey(name: 'watchers_count') required this.watchersCount, this.language, @JsonKey(name: 'forks_count') required this.forksCount, @JsonKey(name: 'open_issues_count') required this.openIssuesCount, @JsonKey(name: 'master_branch') this.masterBranch, @JsonKey(name: 'default_branch') required this.defaultBranch, required this.score, @JsonKey(name: 'archive_url') required this.archiveUrl, @JsonKey(name: 'assignees_url') required this.assigneesUrl, @JsonKey(name: 'blobs_url') required this.blobsUrl, @JsonKey(name: 'branches_url') required this.branchesUrl, @JsonKey(name: 'collaborators_url') required this.collaboratorsUrl, @JsonKey(name: 'comments_url') required this.commentsUrl, @JsonKey(name: 'commits_url') required this.commitsUrl, @JsonKey(name: 'compare_url') required this.compareUrl, @JsonKey(name: 'contents_url') required this.contentsUrl, @JsonKey(name: 'contributors_url') required this.contributorsUrl, @JsonKey(name: 'deployments_url') required this.deploymentsUrl, @JsonKey(name: 'downloads_url') required this.downloadsUrl, @JsonKey(name: 'events_url') required this.eventsUrl, @JsonKey(name: 'forks_url') required this.forksUrl, @JsonKey(name: 'git_commits_url') required this.gitCommitsUrl, @JsonKey(name: 'git_refs_url') required this.gitRefsUrl, @JsonKey(name: 'git_tags_url') required this.gitTagsUrl, @JsonKey(name: 'hooks_url') required this.hooksUrl, @JsonKey(name: 'issue_comment_url') required this.issueCommentUrl, @JsonKey(name: 'issue_events_url') required this.issueEventsUrl, @JsonKey(name: 'issues_url') required this.issuesUrl, @JsonKey(name: 'keys_url') required this.keysUrl, @JsonKey(name: 'labels_url') required this.labelsUrl, @JsonKey(name: 'languages_url') required this.languagesUrl, @JsonKey(name: 'merges_url') required this.mergesUrl, @JsonKey(name: 'milestones_url') required this.milestonesUrl, @JsonKey(name: 'notifications_url') required this.notificationsUrl, @JsonKey(name: 'pulls_url') required this.pullsUrl, @JsonKey(name: 'releases_url') required this.releasesUrl, @JsonKey(name: 'ssh_url') required this.sshUrl, @JsonKey(name: 'clone_url') required this.cloneUrl, @JsonKey(name: 'svn_url') required this.svnUrl, required this.forks, @JsonKey(name: 'open_issues') required this.openIssues, required this.watchers, required final  List<String> topics, @JsonKey(name: 'mirror_url') this.mirrorUrl, @JsonKey(name: 'has_issues') required this.hasIssues, @JsonKey(name: 'has_projects') required this.hasProjects, @JsonKey(name: 'has_pages') required this.hasPages, @JsonKey(name: 'has_wiki') required this.hasWiki, @JsonKey(name: 'has_downloads') required this.hasDownloads, @JsonKey(name: 'has_discussions') this.hasDiscussions, required this.archived, required this.disabled, required this.visibility, this.license, this.permissions}): _topics = topics,super._();
  factory _RepositoryItem.fromJson(Map<String, dynamic> json) => _$RepositoryItemFromJson(json);

@override final  int id;
@override@JsonKey(name: 'node_id') final  String nodeId;
@override final  String name;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  SimpleUser? owner;
@override final  bool private;
@override@JsonKey(name: 'html_url') final  String htmlUrl;
@override final  String? description;
@override final  bool fork;
@override final  String url;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'pushed_at') final  String pushedAt;
@override final  String? homepage;
@override final  int size;
@override@JsonKey(name: 'stargazers_count') final  int stargazersCount;
@override@JsonKey(name: 'watchers_count') final  int watchersCount;
@override final  String? language;
@override@JsonKey(name: 'forks_count') final  int forksCount;
@override@JsonKey(name: 'open_issues_count') final  int openIssuesCount;
@override@JsonKey(name: 'master_branch') final  String? masterBranch;
@override@JsonKey(name: 'default_branch') final  String defaultBranch;
@override final  double score;
@override@JsonKey(name: 'archive_url') final  String archiveUrl;
@override@JsonKey(name: 'assignees_url') final  String assigneesUrl;
@override@JsonKey(name: 'blobs_url') final  String blobsUrl;
@override@JsonKey(name: 'branches_url') final  String branchesUrl;
@override@JsonKey(name: 'collaborators_url') final  String collaboratorsUrl;
@override@JsonKey(name: 'comments_url') final  String commentsUrl;
@override@JsonKey(name: 'commits_url') final  String commitsUrl;
@override@JsonKey(name: 'compare_url') final  String compareUrl;
@override@JsonKey(name: 'contents_url') final  String contentsUrl;
@override@JsonKey(name: 'contributors_url') final  String contributorsUrl;
@override@JsonKey(name: 'deployments_url') final  String deploymentsUrl;
@override@JsonKey(name: 'downloads_url') final  String downloadsUrl;
@override@JsonKey(name: 'events_url') final  String eventsUrl;
@override@JsonKey(name: 'forks_url') final  String forksUrl;
@override@JsonKey(name: 'git_commits_url') final  String gitCommitsUrl;
@override@JsonKey(name: 'git_refs_url') final  String gitRefsUrl;
@override@JsonKey(name: 'git_tags_url') final  String gitTagsUrl;
@override@JsonKey(name: 'hooks_url') final  String hooksUrl;
@override@JsonKey(name: 'issue_comment_url') final  String issueCommentUrl;
@override@JsonKey(name: 'issue_events_url') final  String issueEventsUrl;
@override@JsonKey(name: 'issues_url') final  String issuesUrl;
@override@JsonKey(name: 'keys_url') final  String keysUrl;
@override@JsonKey(name: 'labels_url') final  String labelsUrl;
@override@JsonKey(name: 'languages_url') final  String languagesUrl;
@override@JsonKey(name: 'merges_url') final  String mergesUrl;
@override@JsonKey(name: 'milestones_url') final  String milestonesUrl;
@override@JsonKey(name: 'notifications_url') final  String notificationsUrl;
@override@JsonKey(name: 'pulls_url') final  String pullsUrl;
@override@JsonKey(name: 'releases_url') final  String releasesUrl;
@override@JsonKey(name: 'ssh_url') final  String sshUrl;
@override@JsonKey(name: 'clone_url') final  String cloneUrl;
@override@JsonKey(name: 'svn_url') final  String svnUrl;
@override final  int forks;
@override@JsonKey(name: 'open_issues') final  int openIssues;
@override final  int watchers;
 final  List<String> _topics;
@override List<String> get topics {
  if (_topics is EqualUnmodifiableListView) return _topics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topics);
}

@override@JsonKey(name: 'mirror_url') final  String? mirrorUrl;
@override@JsonKey(name: 'has_issues') final  bool hasIssues;
@override@JsonKey(name: 'has_projects') final  bool hasProjects;
@override@JsonKey(name: 'has_pages') final  bool hasPages;
@override@JsonKey(name: 'has_wiki') final  bool hasWiki;
@override@JsonKey(name: 'has_downloads') final  bool hasDownloads;
@override@JsonKey(name: 'has_discussions') final  bool? hasDiscussions;
@override final  bool archived;
@override final  bool disabled;
@override final  String visibility;
@override final  LicenseSimple? license;
@override final  Permissions? permissions;

/// Create a copy of RepositoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepositoryItemCopyWith<_RepositoryItem> get copyWith => __$RepositoryItemCopyWithImpl<_RepositoryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RepositoryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepositoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.private, private) || other.private == private)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.fork, fork) || other.fork == fork)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.pushedAt, pushedAt) || other.pushedAt == pushedAt)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.size, size) || other.size == size)&&(identical(other.stargazersCount, stargazersCount) || other.stargazersCount == stargazersCount)&&(identical(other.watchersCount, watchersCount) || other.watchersCount == watchersCount)&&(identical(other.language, language) || other.language == language)&&(identical(other.forksCount, forksCount) || other.forksCount == forksCount)&&(identical(other.openIssuesCount, openIssuesCount) || other.openIssuesCount == openIssuesCount)&&(identical(other.masterBranch, masterBranch) || other.masterBranch == masterBranch)&&(identical(other.defaultBranch, defaultBranch) || other.defaultBranch == defaultBranch)&&(identical(other.score, score) || other.score == score)&&(identical(other.archiveUrl, archiveUrl) || other.archiveUrl == archiveUrl)&&(identical(other.assigneesUrl, assigneesUrl) || other.assigneesUrl == assigneesUrl)&&(identical(other.blobsUrl, blobsUrl) || other.blobsUrl == blobsUrl)&&(identical(other.branchesUrl, branchesUrl) || other.branchesUrl == branchesUrl)&&(identical(other.collaboratorsUrl, collaboratorsUrl) || other.collaboratorsUrl == collaboratorsUrl)&&(identical(other.commentsUrl, commentsUrl) || other.commentsUrl == commentsUrl)&&(identical(other.commitsUrl, commitsUrl) || other.commitsUrl == commitsUrl)&&(identical(other.compareUrl, compareUrl) || other.compareUrl == compareUrl)&&(identical(other.contentsUrl, contentsUrl) || other.contentsUrl == contentsUrl)&&(identical(other.contributorsUrl, contributorsUrl) || other.contributorsUrl == contributorsUrl)&&(identical(other.deploymentsUrl, deploymentsUrl) || other.deploymentsUrl == deploymentsUrl)&&(identical(other.downloadsUrl, downloadsUrl) || other.downloadsUrl == downloadsUrl)&&(identical(other.eventsUrl, eventsUrl) || other.eventsUrl == eventsUrl)&&(identical(other.forksUrl, forksUrl) || other.forksUrl == forksUrl)&&(identical(other.gitCommitsUrl, gitCommitsUrl) || other.gitCommitsUrl == gitCommitsUrl)&&(identical(other.gitRefsUrl, gitRefsUrl) || other.gitRefsUrl == gitRefsUrl)&&(identical(other.gitTagsUrl, gitTagsUrl) || other.gitTagsUrl == gitTagsUrl)&&(identical(other.hooksUrl, hooksUrl) || other.hooksUrl == hooksUrl)&&(identical(other.issueCommentUrl, issueCommentUrl) || other.issueCommentUrl == issueCommentUrl)&&(identical(other.issueEventsUrl, issueEventsUrl) || other.issueEventsUrl == issueEventsUrl)&&(identical(other.issuesUrl, issuesUrl) || other.issuesUrl == issuesUrl)&&(identical(other.keysUrl, keysUrl) || other.keysUrl == keysUrl)&&(identical(other.labelsUrl, labelsUrl) || other.labelsUrl == labelsUrl)&&(identical(other.languagesUrl, languagesUrl) || other.languagesUrl == languagesUrl)&&(identical(other.mergesUrl, mergesUrl) || other.mergesUrl == mergesUrl)&&(identical(other.milestonesUrl, milestonesUrl) || other.milestonesUrl == milestonesUrl)&&(identical(other.notificationsUrl, notificationsUrl) || other.notificationsUrl == notificationsUrl)&&(identical(other.pullsUrl, pullsUrl) || other.pullsUrl == pullsUrl)&&(identical(other.releasesUrl, releasesUrl) || other.releasesUrl == releasesUrl)&&(identical(other.sshUrl, sshUrl) || other.sshUrl == sshUrl)&&(identical(other.cloneUrl, cloneUrl) || other.cloneUrl == cloneUrl)&&(identical(other.svnUrl, svnUrl) || other.svnUrl == svnUrl)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.openIssues, openIssues) || other.openIssues == openIssues)&&(identical(other.watchers, watchers) || other.watchers == watchers)&&const DeepCollectionEquality().equals(other._topics, _topics)&&(identical(other.mirrorUrl, mirrorUrl) || other.mirrorUrl == mirrorUrl)&&(identical(other.hasIssues, hasIssues) || other.hasIssues == hasIssues)&&(identical(other.hasProjects, hasProjects) || other.hasProjects == hasProjects)&&(identical(other.hasPages, hasPages) || other.hasPages == hasPages)&&(identical(other.hasWiki, hasWiki) || other.hasWiki == hasWiki)&&(identical(other.hasDownloads, hasDownloads) || other.hasDownloads == hasDownloads)&&(identical(other.hasDiscussions, hasDiscussions) || other.hasDiscussions == hasDiscussions)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.license, license) || other.license == license)&&(identical(other.permissions, permissions) || other.permissions == permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,nodeId,name,fullName,owner,private,htmlUrl,description,fork,url,createdAt,updatedAt,pushedAt,homepage,size,stargazersCount,watchersCount,language,forksCount,openIssuesCount,masterBranch,defaultBranch,score,archiveUrl,assigneesUrl,blobsUrl,branchesUrl,collaboratorsUrl,commentsUrl,commitsUrl,compareUrl,contentsUrl,contributorsUrl,deploymentsUrl,downloadsUrl,eventsUrl,forksUrl,gitCommitsUrl,gitRefsUrl,gitTagsUrl,hooksUrl,issueCommentUrl,issueEventsUrl,issuesUrl,keysUrl,labelsUrl,languagesUrl,mergesUrl,milestonesUrl,notificationsUrl,pullsUrl,releasesUrl,sshUrl,cloneUrl,svnUrl,forks,openIssues,watchers,const DeepCollectionEquality().hash(_topics),mirrorUrl,hasIssues,hasProjects,hasPages,hasWiki,hasDownloads,hasDiscussions,archived,disabled,visibility,license,permissions]);

@override
String toString() {
  return 'RepositoryItem(id: $id, nodeId: $nodeId, name: $name, fullName: $fullName, owner: $owner, private: $private, htmlUrl: $htmlUrl, description: $description, fork: $fork, url: $url, createdAt: $createdAt, updatedAt: $updatedAt, pushedAt: $pushedAt, homepage: $homepage, size: $size, stargazersCount: $stargazersCount, watchersCount: $watchersCount, language: $language, forksCount: $forksCount, openIssuesCount: $openIssuesCount, masterBranch: $masterBranch, defaultBranch: $defaultBranch, score: $score, archiveUrl: $archiveUrl, assigneesUrl: $assigneesUrl, blobsUrl: $blobsUrl, branchesUrl: $branchesUrl, collaboratorsUrl: $collaboratorsUrl, commentsUrl: $commentsUrl, commitsUrl: $commitsUrl, compareUrl: $compareUrl, contentsUrl: $contentsUrl, contributorsUrl: $contributorsUrl, deploymentsUrl: $deploymentsUrl, downloadsUrl: $downloadsUrl, eventsUrl: $eventsUrl, forksUrl: $forksUrl, gitCommitsUrl: $gitCommitsUrl, gitRefsUrl: $gitRefsUrl, gitTagsUrl: $gitTagsUrl, hooksUrl: $hooksUrl, issueCommentUrl: $issueCommentUrl, issueEventsUrl: $issueEventsUrl, issuesUrl: $issuesUrl, keysUrl: $keysUrl, labelsUrl: $labelsUrl, languagesUrl: $languagesUrl, mergesUrl: $mergesUrl, milestonesUrl: $milestonesUrl, notificationsUrl: $notificationsUrl, pullsUrl: $pullsUrl, releasesUrl: $releasesUrl, sshUrl: $sshUrl, cloneUrl: $cloneUrl, svnUrl: $svnUrl, forks: $forks, openIssues: $openIssues, watchers: $watchers, topics: $topics, mirrorUrl: $mirrorUrl, hasIssues: $hasIssues, hasProjects: $hasProjects, hasPages: $hasPages, hasWiki: $hasWiki, hasDownloads: $hasDownloads, hasDiscussions: $hasDiscussions, archived: $archived, disabled: $disabled, visibility: $visibility, license: $license, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$RepositoryItemCopyWith<$Res> implements $RepositoryItemCopyWith<$Res> {
  factory _$RepositoryItemCopyWith(_RepositoryItem value, $Res Function(_RepositoryItem) _then) = __$RepositoryItemCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'node_id') String nodeId, String name,@JsonKey(name: 'full_name') String fullName, SimpleUser? owner, bool private,@JsonKey(name: 'html_url') String htmlUrl, String? description, bool fork, String url,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'pushed_at') String pushedAt, String? homepage, int size,@JsonKey(name: 'stargazers_count') int stargazersCount,@JsonKey(name: 'watchers_count') int watchersCount, String? language,@JsonKey(name: 'forks_count') int forksCount,@JsonKey(name: 'open_issues_count') int openIssuesCount,@JsonKey(name: 'master_branch') String? masterBranch,@JsonKey(name: 'default_branch') String defaultBranch, double score,@JsonKey(name: 'archive_url') String archiveUrl,@JsonKey(name: 'assignees_url') String assigneesUrl,@JsonKey(name: 'blobs_url') String blobsUrl,@JsonKey(name: 'branches_url') String branchesUrl,@JsonKey(name: 'collaborators_url') String collaboratorsUrl,@JsonKey(name: 'comments_url') String commentsUrl,@JsonKey(name: 'commits_url') String commitsUrl,@JsonKey(name: 'compare_url') String compareUrl,@JsonKey(name: 'contents_url') String contentsUrl,@JsonKey(name: 'contributors_url') String contributorsUrl,@JsonKey(name: 'deployments_url') String deploymentsUrl,@JsonKey(name: 'downloads_url') String downloadsUrl,@JsonKey(name: 'events_url') String eventsUrl,@JsonKey(name: 'forks_url') String forksUrl,@JsonKey(name: 'git_commits_url') String gitCommitsUrl,@JsonKey(name: 'git_refs_url') String gitRefsUrl,@JsonKey(name: 'git_tags_url') String gitTagsUrl,@JsonKey(name: 'hooks_url') String hooksUrl,@JsonKey(name: 'issue_comment_url') String issueCommentUrl,@JsonKey(name: 'issue_events_url') String issueEventsUrl,@JsonKey(name: 'issues_url') String issuesUrl,@JsonKey(name: 'keys_url') String keysUrl,@JsonKey(name: 'labels_url') String labelsUrl,@JsonKey(name: 'languages_url') String languagesUrl,@JsonKey(name: 'merges_url') String mergesUrl,@JsonKey(name: 'milestones_url') String milestonesUrl,@JsonKey(name: 'notifications_url') String notificationsUrl,@JsonKey(name: 'pulls_url') String pullsUrl,@JsonKey(name: 'releases_url') String releasesUrl,@JsonKey(name: 'ssh_url') String sshUrl,@JsonKey(name: 'clone_url') String cloneUrl,@JsonKey(name: 'svn_url') String svnUrl, int forks,@JsonKey(name: 'open_issues') int openIssues, int watchers, List<String> topics,@JsonKey(name: 'mirror_url') String? mirrorUrl,@JsonKey(name: 'has_issues') bool hasIssues,@JsonKey(name: 'has_projects') bool hasProjects,@JsonKey(name: 'has_pages') bool hasPages,@JsonKey(name: 'has_wiki') bool hasWiki,@JsonKey(name: 'has_downloads') bool hasDownloads,@JsonKey(name: 'has_discussions') bool? hasDiscussions, bool archived, bool disabled, String visibility, LicenseSimple? license, Permissions? permissions
});


@override $SimpleUserCopyWith<$Res>? get owner;@override $LicenseSimpleCopyWith<$Res>? get license;@override $PermissionsCopyWith<$Res>? get permissions;

}
/// @nodoc
class __$RepositoryItemCopyWithImpl<$Res>
    implements _$RepositoryItemCopyWith<$Res> {
  __$RepositoryItemCopyWithImpl(this._self, this._then);

  final _RepositoryItem _self;
  final $Res Function(_RepositoryItem) _then;

/// Create a copy of RepositoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nodeId = null,Object? name = null,Object? fullName = null,Object? owner = freezed,Object? private = null,Object? htmlUrl = null,Object? description = freezed,Object? fork = null,Object? url = null,Object? createdAt = null,Object? updatedAt = null,Object? pushedAt = null,Object? homepage = freezed,Object? size = null,Object? stargazersCount = null,Object? watchersCount = null,Object? language = freezed,Object? forksCount = null,Object? openIssuesCount = null,Object? masterBranch = freezed,Object? defaultBranch = null,Object? score = null,Object? archiveUrl = null,Object? assigneesUrl = null,Object? blobsUrl = null,Object? branchesUrl = null,Object? collaboratorsUrl = null,Object? commentsUrl = null,Object? commitsUrl = null,Object? compareUrl = null,Object? contentsUrl = null,Object? contributorsUrl = null,Object? deploymentsUrl = null,Object? downloadsUrl = null,Object? eventsUrl = null,Object? forksUrl = null,Object? gitCommitsUrl = null,Object? gitRefsUrl = null,Object? gitTagsUrl = null,Object? hooksUrl = null,Object? issueCommentUrl = null,Object? issueEventsUrl = null,Object? issuesUrl = null,Object? keysUrl = null,Object? labelsUrl = null,Object? languagesUrl = null,Object? mergesUrl = null,Object? milestonesUrl = null,Object? notificationsUrl = null,Object? pullsUrl = null,Object? releasesUrl = null,Object? sshUrl = null,Object? cloneUrl = null,Object? svnUrl = null,Object? forks = null,Object? openIssues = null,Object? watchers = null,Object? topics = null,Object? mirrorUrl = freezed,Object? hasIssues = null,Object? hasProjects = null,Object? hasPages = null,Object? hasWiki = null,Object? hasDownloads = null,Object? hasDiscussions = freezed,Object? archived = null,Object? disabled = null,Object? visibility = null,Object? license = freezed,Object? permissions = freezed,}) {
  return _then(_RepositoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as SimpleUser?,private: null == private ? _self.private : private // ignore: cast_nullable_to_non_nullable
as bool,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,fork: null == fork ? _self.fork : fork // ignore: cast_nullable_to_non_nullable
as bool,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,pushedAt: null == pushedAt ? _self.pushedAt : pushedAt // ignore: cast_nullable_to_non_nullable
as String,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,stargazersCount: null == stargazersCount ? _self.stargazersCount : stargazersCount // ignore: cast_nullable_to_non_nullable
as int,watchersCount: null == watchersCount ? _self.watchersCount : watchersCount // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,forksCount: null == forksCount ? _self.forksCount : forksCount // ignore: cast_nullable_to_non_nullable
as int,openIssuesCount: null == openIssuesCount ? _self.openIssuesCount : openIssuesCount // ignore: cast_nullable_to_non_nullable
as int,masterBranch: freezed == masterBranch ? _self.masterBranch : masterBranch // ignore: cast_nullable_to_non_nullable
as String?,defaultBranch: null == defaultBranch ? _self.defaultBranch : defaultBranch // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,archiveUrl: null == archiveUrl ? _self.archiveUrl : archiveUrl // ignore: cast_nullable_to_non_nullable
as String,assigneesUrl: null == assigneesUrl ? _self.assigneesUrl : assigneesUrl // ignore: cast_nullable_to_non_nullable
as String,blobsUrl: null == blobsUrl ? _self.blobsUrl : blobsUrl // ignore: cast_nullable_to_non_nullable
as String,branchesUrl: null == branchesUrl ? _self.branchesUrl : branchesUrl // ignore: cast_nullable_to_non_nullable
as String,collaboratorsUrl: null == collaboratorsUrl ? _self.collaboratorsUrl : collaboratorsUrl // ignore: cast_nullable_to_non_nullable
as String,commentsUrl: null == commentsUrl ? _self.commentsUrl : commentsUrl // ignore: cast_nullable_to_non_nullable
as String,commitsUrl: null == commitsUrl ? _self.commitsUrl : commitsUrl // ignore: cast_nullable_to_non_nullable
as String,compareUrl: null == compareUrl ? _self.compareUrl : compareUrl // ignore: cast_nullable_to_non_nullable
as String,contentsUrl: null == contentsUrl ? _self.contentsUrl : contentsUrl // ignore: cast_nullable_to_non_nullable
as String,contributorsUrl: null == contributorsUrl ? _self.contributorsUrl : contributorsUrl // ignore: cast_nullable_to_non_nullable
as String,deploymentsUrl: null == deploymentsUrl ? _self.deploymentsUrl : deploymentsUrl // ignore: cast_nullable_to_non_nullable
as String,downloadsUrl: null == downloadsUrl ? _self.downloadsUrl : downloadsUrl // ignore: cast_nullable_to_non_nullable
as String,eventsUrl: null == eventsUrl ? _self.eventsUrl : eventsUrl // ignore: cast_nullable_to_non_nullable
as String,forksUrl: null == forksUrl ? _self.forksUrl : forksUrl // ignore: cast_nullable_to_non_nullable
as String,gitCommitsUrl: null == gitCommitsUrl ? _self.gitCommitsUrl : gitCommitsUrl // ignore: cast_nullable_to_non_nullable
as String,gitRefsUrl: null == gitRefsUrl ? _self.gitRefsUrl : gitRefsUrl // ignore: cast_nullable_to_non_nullable
as String,gitTagsUrl: null == gitTagsUrl ? _self.gitTagsUrl : gitTagsUrl // ignore: cast_nullable_to_non_nullable
as String,hooksUrl: null == hooksUrl ? _self.hooksUrl : hooksUrl // ignore: cast_nullable_to_non_nullable
as String,issueCommentUrl: null == issueCommentUrl ? _self.issueCommentUrl : issueCommentUrl // ignore: cast_nullable_to_non_nullable
as String,issueEventsUrl: null == issueEventsUrl ? _self.issueEventsUrl : issueEventsUrl // ignore: cast_nullable_to_non_nullable
as String,issuesUrl: null == issuesUrl ? _self.issuesUrl : issuesUrl // ignore: cast_nullable_to_non_nullable
as String,keysUrl: null == keysUrl ? _self.keysUrl : keysUrl // ignore: cast_nullable_to_non_nullable
as String,labelsUrl: null == labelsUrl ? _self.labelsUrl : labelsUrl // ignore: cast_nullable_to_non_nullable
as String,languagesUrl: null == languagesUrl ? _self.languagesUrl : languagesUrl // ignore: cast_nullable_to_non_nullable
as String,mergesUrl: null == mergesUrl ? _self.mergesUrl : mergesUrl // ignore: cast_nullable_to_non_nullable
as String,milestonesUrl: null == milestonesUrl ? _self.milestonesUrl : milestonesUrl // ignore: cast_nullable_to_non_nullable
as String,notificationsUrl: null == notificationsUrl ? _self.notificationsUrl : notificationsUrl // ignore: cast_nullable_to_non_nullable
as String,pullsUrl: null == pullsUrl ? _self.pullsUrl : pullsUrl // ignore: cast_nullable_to_non_nullable
as String,releasesUrl: null == releasesUrl ? _self.releasesUrl : releasesUrl // ignore: cast_nullable_to_non_nullable
as String,sshUrl: null == sshUrl ? _self.sshUrl : sshUrl // ignore: cast_nullable_to_non_nullable
as String,cloneUrl: null == cloneUrl ? _self.cloneUrl : cloneUrl // ignore: cast_nullable_to_non_nullable
as String,svnUrl: null == svnUrl ? _self.svnUrl : svnUrl // ignore: cast_nullable_to_non_nullable
as String,forks: null == forks ? _self.forks : forks // ignore: cast_nullable_to_non_nullable
as int,openIssues: null == openIssues ? _self.openIssues : openIssues // ignore: cast_nullable_to_non_nullable
as int,watchers: null == watchers ? _self.watchers : watchers // ignore: cast_nullable_to_non_nullable
as int,topics: null == topics ? _self._topics : topics // ignore: cast_nullable_to_non_nullable
as List<String>,mirrorUrl: freezed == mirrorUrl ? _self.mirrorUrl : mirrorUrl // ignore: cast_nullable_to_non_nullable
as String?,hasIssues: null == hasIssues ? _self.hasIssues : hasIssues // ignore: cast_nullable_to_non_nullable
as bool,hasProjects: null == hasProjects ? _self.hasProjects : hasProjects // ignore: cast_nullable_to_non_nullable
as bool,hasPages: null == hasPages ? _self.hasPages : hasPages // ignore: cast_nullable_to_non_nullable
as bool,hasWiki: null == hasWiki ? _self.hasWiki : hasWiki // ignore: cast_nullable_to_non_nullable
as bool,hasDownloads: null == hasDownloads ? _self.hasDownloads : hasDownloads // ignore: cast_nullable_to_non_nullable
as bool,hasDiscussions: freezed == hasDiscussions ? _self.hasDiscussions : hasDiscussions // ignore: cast_nullable_to_non_nullable
as bool?,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as String,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as LicenseSimple?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Permissions?,
  ));
}

/// Create a copy of RepositoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SimpleUserCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $SimpleUserCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of RepositoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LicenseSimpleCopyWith<$Res>? get license {
    if (_self.license == null) {
    return null;
  }

  return $LicenseSimpleCopyWith<$Res>(_self.license!, (value) {
    return _then(_self.copyWith(license: value));
  });
}/// Create a copy of RepositoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PermissionsCopyWith<$Res>? get permissions {
    if (_self.permissions == null) {
    return null;
  }

  return $PermissionsCopyWith<$Res>(_self.permissions!, (value) {
    return _then(_self.copyWith(permissions: value));
  });
}
}


/// @nodoc
mixin _$SimpleUser {

 String? get name; String? get email; String get login; int get id;@JsonKey(name: 'node_id') String get nodeId;@JsonKey(name: 'avatar_url') String get avatarUrl;@JsonKey(name: 'gravatar_id') String? get gravatarId; String get url;@JsonKey(name: 'html_url') String get htmlUrl;@JsonKey(name: 'followers_url') String get followersUrl;@JsonKey(name: 'following_url') String get followingUrl;@JsonKey(name: 'gists_url') String get gistsUrl;@JsonKey(name: 'starred_url') String get starredUrl;@JsonKey(name: 'subscriptions_url') String get subscriptionsUrl;@JsonKey(name: 'organizations_url') String get organizationsUrl;@JsonKey(name: 'repos_url') String get reposUrl;@JsonKey(name: 'events_url') String get eventsUrl;@JsonKey(name: 'received_events_url') String get receivedEventsUrl; String get type;@JsonKey(name: 'site_admin') bool get siteAdmin;@JsonKey(name: 'starred_at') String? get starredAt;@JsonKey(name: 'user_view_type') String? get userViewType;
/// Create a copy of SimpleUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimpleUserCopyWith<SimpleUser> get copyWith => _$SimpleUserCopyWithImpl<SimpleUser>(this as SimpleUser, _$identity);

  /// Serializes this SimpleUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimpleUser&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.login, login) || other.login == login)&&(identical(other.id, id) || other.id == id)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.gravatarId, gravatarId) || other.gravatarId == gravatarId)&&(identical(other.url, url) || other.url == url)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.followersUrl, followersUrl) || other.followersUrl == followersUrl)&&(identical(other.followingUrl, followingUrl) || other.followingUrl == followingUrl)&&(identical(other.gistsUrl, gistsUrl) || other.gistsUrl == gistsUrl)&&(identical(other.starredUrl, starredUrl) || other.starredUrl == starredUrl)&&(identical(other.subscriptionsUrl, subscriptionsUrl) || other.subscriptionsUrl == subscriptionsUrl)&&(identical(other.organizationsUrl, organizationsUrl) || other.organizationsUrl == organizationsUrl)&&(identical(other.reposUrl, reposUrl) || other.reposUrl == reposUrl)&&(identical(other.eventsUrl, eventsUrl) || other.eventsUrl == eventsUrl)&&(identical(other.receivedEventsUrl, receivedEventsUrl) || other.receivedEventsUrl == receivedEventsUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.siteAdmin, siteAdmin) || other.siteAdmin == siteAdmin)&&(identical(other.starredAt, starredAt) || other.starredAt == starredAt)&&(identical(other.userViewType, userViewType) || other.userViewType == userViewType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,email,login,id,nodeId,avatarUrl,gravatarId,url,htmlUrl,followersUrl,followingUrl,gistsUrl,starredUrl,subscriptionsUrl,organizationsUrl,reposUrl,eventsUrl,receivedEventsUrl,type,siteAdmin,starredAt,userViewType]);

@override
String toString() {
  return 'SimpleUser(name: $name, email: $email, login: $login, id: $id, nodeId: $nodeId, avatarUrl: $avatarUrl, gravatarId: $gravatarId, url: $url, htmlUrl: $htmlUrl, followersUrl: $followersUrl, followingUrl: $followingUrl, gistsUrl: $gistsUrl, starredUrl: $starredUrl, subscriptionsUrl: $subscriptionsUrl, organizationsUrl: $organizationsUrl, reposUrl: $reposUrl, eventsUrl: $eventsUrl, receivedEventsUrl: $receivedEventsUrl, type: $type, siteAdmin: $siteAdmin, starredAt: $starredAt, userViewType: $userViewType)';
}


}

/// @nodoc
abstract mixin class $SimpleUserCopyWith<$Res>  {
  factory $SimpleUserCopyWith(SimpleUser value, $Res Function(SimpleUser) _then) = _$SimpleUserCopyWithImpl;
@useResult
$Res call({
 String? name, String? email, String login, int id,@JsonKey(name: 'node_id') String nodeId,@JsonKey(name: 'avatar_url') String avatarUrl,@JsonKey(name: 'gravatar_id') String? gravatarId, String url,@JsonKey(name: 'html_url') String htmlUrl,@JsonKey(name: 'followers_url') String followersUrl,@JsonKey(name: 'following_url') String followingUrl,@JsonKey(name: 'gists_url') String gistsUrl,@JsonKey(name: 'starred_url') String starredUrl,@JsonKey(name: 'subscriptions_url') String subscriptionsUrl,@JsonKey(name: 'organizations_url') String organizationsUrl,@JsonKey(name: 'repos_url') String reposUrl,@JsonKey(name: 'events_url') String eventsUrl,@JsonKey(name: 'received_events_url') String receivedEventsUrl, String type,@JsonKey(name: 'site_admin') bool siteAdmin,@JsonKey(name: 'starred_at') String? starredAt,@JsonKey(name: 'user_view_type') String? userViewType
});




}
/// @nodoc
class _$SimpleUserCopyWithImpl<$Res>
    implements $SimpleUserCopyWith<$Res> {
  _$SimpleUserCopyWithImpl(this._self, this._then);

  final SimpleUser _self;
  final $Res Function(SimpleUser) _then;

/// Create a copy of SimpleUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? email = freezed,Object? login = null,Object? id = null,Object? nodeId = null,Object? avatarUrl = null,Object? gravatarId = freezed,Object? url = null,Object? htmlUrl = null,Object? followersUrl = null,Object? followingUrl = null,Object? gistsUrl = null,Object? starredUrl = null,Object? subscriptionsUrl = null,Object? organizationsUrl = null,Object? reposUrl = null,Object? eventsUrl = null,Object? receivedEventsUrl = null,Object? type = null,Object? siteAdmin = null,Object? starredAt = freezed,Object? userViewType = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,gravatarId: freezed == gravatarId ? _self.gravatarId : gravatarId // ignore: cast_nullable_to_non_nullable
as String?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,followersUrl: null == followersUrl ? _self.followersUrl : followersUrl // ignore: cast_nullable_to_non_nullable
as String,followingUrl: null == followingUrl ? _self.followingUrl : followingUrl // ignore: cast_nullable_to_non_nullable
as String,gistsUrl: null == gistsUrl ? _self.gistsUrl : gistsUrl // ignore: cast_nullable_to_non_nullable
as String,starredUrl: null == starredUrl ? _self.starredUrl : starredUrl // ignore: cast_nullable_to_non_nullable
as String,subscriptionsUrl: null == subscriptionsUrl ? _self.subscriptionsUrl : subscriptionsUrl // ignore: cast_nullable_to_non_nullable
as String,organizationsUrl: null == organizationsUrl ? _self.organizationsUrl : organizationsUrl // ignore: cast_nullable_to_non_nullable
as String,reposUrl: null == reposUrl ? _self.reposUrl : reposUrl // ignore: cast_nullable_to_non_nullable
as String,eventsUrl: null == eventsUrl ? _self.eventsUrl : eventsUrl // ignore: cast_nullable_to_non_nullable
as String,receivedEventsUrl: null == receivedEventsUrl ? _self.receivedEventsUrl : receivedEventsUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,siteAdmin: null == siteAdmin ? _self.siteAdmin : siteAdmin // ignore: cast_nullable_to_non_nullable
as bool,starredAt: freezed == starredAt ? _self.starredAt : starredAt // ignore: cast_nullable_to_non_nullable
as String?,userViewType: freezed == userViewType ? _self.userViewType : userViewType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SimpleUser].
extension SimpleUserPatterns on SimpleUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimpleUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimpleUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimpleUser value)  $default,){
final _that = this;
switch (_that) {
case _SimpleUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimpleUser value)?  $default,){
final _that = this;
switch (_that) {
case _SimpleUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? email,  String login,  int id, @JsonKey(name: 'node_id')  String nodeId, @JsonKey(name: 'avatar_url')  String avatarUrl, @JsonKey(name: 'gravatar_id')  String? gravatarId,  String url, @JsonKey(name: 'html_url')  String htmlUrl, @JsonKey(name: 'followers_url')  String followersUrl, @JsonKey(name: 'following_url')  String followingUrl, @JsonKey(name: 'gists_url')  String gistsUrl, @JsonKey(name: 'starred_url')  String starredUrl, @JsonKey(name: 'subscriptions_url')  String subscriptionsUrl, @JsonKey(name: 'organizations_url')  String organizationsUrl, @JsonKey(name: 'repos_url')  String reposUrl, @JsonKey(name: 'events_url')  String eventsUrl, @JsonKey(name: 'received_events_url')  String receivedEventsUrl,  String type, @JsonKey(name: 'site_admin')  bool siteAdmin, @JsonKey(name: 'starred_at')  String? starredAt, @JsonKey(name: 'user_view_type')  String? userViewType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimpleUser() when $default != null:
return $default(_that.name,_that.email,_that.login,_that.id,_that.nodeId,_that.avatarUrl,_that.gravatarId,_that.url,_that.htmlUrl,_that.followersUrl,_that.followingUrl,_that.gistsUrl,_that.starredUrl,_that.subscriptionsUrl,_that.organizationsUrl,_that.reposUrl,_that.eventsUrl,_that.receivedEventsUrl,_that.type,_that.siteAdmin,_that.starredAt,_that.userViewType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? email,  String login,  int id, @JsonKey(name: 'node_id')  String nodeId, @JsonKey(name: 'avatar_url')  String avatarUrl, @JsonKey(name: 'gravatar_id')  String? gravatarId,  String url, @JsonKey(name: 'html_url')  String htmlUrl, @JsonKey(name: 'followers_url')  String followersUrl, @JsonKey(name: 'following_url')  String followingUrl, @JsonKey(name: 'gists_url')  String gistsUrl, @JsonKey(name: 'starred_url')  String starredUrl, @JsonKey(name: 'subscriptions_url')  String subscriptionsUrl, @JsonKey(name: 'organizations_url')  String organizationsUrl, @JsonKey(name: 'repos_url')  String reposUrl, @JsonKey(name: 'events_url')  String eventsUrl, @JsonKey(name: 'received_events_url')  String receivedEventsUrl,  String type, @JsonKey(name: 'site_admin')  bool siteAdmin, @JsonKey(name: 'starred_at')  String? starredAt, @JsonKey(name: 'user_view_type')  String? userViewType)  $default,) {final _that = this;
switch (_that) {
case _SimpleUser():
return $default(_that.name,_that.email,_that.login,_that.id,_that.nodeId,_that.avatarUrl,_that.gravatarId,_that.url,_that.htmlUrl,_that.followersUrl,_that.followingUrl,_that.gistsUrl,_that.starredUrl,_that.subscriptionsUrl,_that.organizationsUrl,_that.reposUrl,_that.eventsUrl,_that.receivedEventsUrl,_that.type,_that.siteAdmin,_that.starredAt,_that.userViewType);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? email,  String login,  int id, @JsonKey(name: 'node_id')  String nodeId, @JsonKey(name: 'avatar_url')  String avatarUrl, @JsonKey(name: 'gravatar_id')  String? gravatarId,  String url, @JsonKey(name: 'html_url')  String htmlUrl, @JsonKey(name: 'followers_url')  String followersUrl, @JsonKey(name: 'following_url')  String followingUrl, @JsonKey(name: 'gists_url')  String gistsUrl, @JsonKey(name: 'starred_url')  String starredUrl, @JsonKey(name: 'subscriptions_url')  String subscriptionsUrl, @JsonKey(name: 'organizations_url')  String organizationsUrl, @JsonKey(name: 'repos_url')  String reposUrl, @JsonKey(name: 'events_url')  String eventsUrl, @JsonKey(name: 'received_events_url')  String receivedEventsUrl,  String type, @JsonKey(name: 'site_admin')  bool siteAdmin, @JsonKey(name: 'starred_at')  String? starredAt, @JsonKey(name: 'user_view_type')  String? userViewType)?  $default,) {final _that = this;
switch (_that) {
case _SimpleUser() when $default != null:
return $default(_that.name,_that.email,_that.login,_that.id,_that.nodeId,_that.avatarUrl,_that.gravatarId,_that.url,_that.htmlUrl,_that.followersUrl,_that.followingUrl,_that.gistsUrl,_that.starredUrl,_that.subscriptionsUrl,_that.organizationsUrl,_that.reposUrl,_that.eventsUrl,_that.receivedEventsUrl,_that.type,_that.siteAdmin,_that.starredAt,_that.userViewType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SimpleUser extends SimpleUser {
  const _SimpleUser({this.name, this.email, required this.login, required this.id, @JsonKey(name: 'node_id') required this.nodeId, @JsonKey(name: 'avatar_url') required this.avatarUrl, @JsonKey(name: 'gravatar_id') this.gravatarId, required this.url, @JsonKey(name: 'html_url') required this.htmlUrl, @JsonKey(name: 'followers_url') required this.followersUrl, @JsonKey(name: 'following_url') required this.followingUrl, @JsonKey(name: 'gists_url') required this.gistsUrl, @JsonKey(name: 'starred_url') required this.starredUrl, @JsonKey(name: 'subscriptions_url') required this.subscriptionsUrl, @JsonKey(name: 'organizations_url') required this.organizationsUrl, @JsonKey(name: 'repos_url') required this.reposUrl, @JsonKey(name: 'events_url') required this.eventsUrl, @JsonKey(name: 'received_events_url') required this.receivedEventsUrl, required this.type, @JsonKey(name: 'site_admin') required this.siteAdmin, @JsonKey(name: 'starred_at') this.starredAt, @JsonKey(name: 'user_view_type') this.userViewType}): super._();
  factory _SimpleUser.fromJson(Map<String, dynamic> json) => _$SimpleUserFromJson(json);

@override final  String? name;
@override final  String? email;
@override final  String login;
@override final  int id;
@override@JsonKey(name: 'node_id') final  String nodeId;
@override@JsonKey(name: 'avatar_url') final  String avatarUrl;
@override@JsonKey(name: 'gravatar_id') final  String? gravatarId;
@override final  String url;
@override@JsonKey(name: 'html_url') final  String htmlUrl;
@override@JsonKey(name: 'followers_url') final  String followersUrl;
@override@JsonKey(name: 'following_url') final  String followingUrl;
@override@JsonKey(name: 'gists_url') final  String gistsUrl;
@override@JsonKey(name: 'starred_url') final  String starredUrl;
@override@JsonKey(name: 'subscriptions_url') final  String subscriptionsUrl;
@override@JsonKey(name: 'organizations_url') final  String organizationsUrl;
@override@JsonKey(name: 'repos_url') final  String reposUrl;
@override@JsonKey(name: 'events_url') final  String eventsUrl;
@override@JsonKey(name: 'received_events_url') final  String receivedEventsUrl;
@override final  String type;
@override@JsonKey(name: 'site_admin') final  bool siteAdmin;
@override@JsonKey(name: 'starred_at') final  String? starredAt;
@override@JsonKey(name: 'user_view_type') final  String? userViewType;

/// Create a copy of SimpleUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimpleUserCopyWith<_SimpleUser> get copyWith => __$SimpleUserCopyWithImpl<_SimpleUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SimpleUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimpleUser&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.login, login) || other.login == login)&&(identical(other.id, id) || other.id == id)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.gravatarId, gravatarId) || other.gravatarId == gravatarId)&&(identical(other.url, url) || other.url == url)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.followersUrl, followersUrl) || other.followersUrl == followersUrl)&&(identical(other.followingUrl, followingUrl) || other.followingUrl == followingUrl)&&(identical(other.gistsUrl, gistsUrl) || other.gistsUrl == gistsUrl)&&(identical(other.starredUrl, starredUrl) || other.starredUrl == starredUrl)&&(identical(other.subscriptionsUrl, subscriptionsUrl) || other.subscriptionsUrl == subscriptionsUrl)&&(identical(other.organizationsUrl, organizationsUrl) || other.organizationsUrl == organizationsUrl)&&(identical(other.reposUrl, reposUrl) || other.reposUrl == reposUrl)&&(identical(other.eventsUrl, eventsUrl) || other.eventsUrl == eventsUrl)&&(identical(other.receivedEventsUrl, receivedEventsUrl) || other.receivedEventsUrl == receivedEventsUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.siteAdmin, siteAdmin) || other.siteAdmin == siteAdmin)&&(identical(other.starredAt, starredAt) || other.starredAt == starredAt)&&(identical(other.userViewType, userViewType) || other.userViewType == userViewType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,email,login,id,nodeId,avatarUrl,gravatarId,url,htmlUrl,followersUrl,followingUrl,gistsUrl,starredUrl,subscriptionsUrl,organizationsUrl,reposUrl,eventsUrl,receivedEventsUrl,type,siteAdmin,starredAt,userViewType]);

@override
String toString() {
  return 'SimpleUser(name: $name, email: $email, login: $login, id: $id, nodeId: $nodeId, avatarUrl: $avatarUrl, gravatarId: $gravatarId, url: $url, htmlUrl: $htmlUrl, followersUrl: $followersUrl, followingUrl: $followingUrl, gistsUrl: $gistsUrl, starredUrl: $starredUrl, subscriptionsUrl: $subscriptionsUrl, organizationsUrl: $organizationsUrl, reposUrl: $reposUrl, eventsUrl: $eventsUrl, receivedEventsUrl: $receivedEventsUrl, type: $type, siteAdmin: $siteAdmin, starredAt: $starredAt, userViewType: $userViewType)';
}


}

/// @nodoc
abstract mixin class _$SimpleUserCopyWith<$Res> implements $SimpleUserCopyWith<$Res> {
  factory _$SimpleUserCopyWith(_SimpleUser value, $Res Function(_SimpleUser) _then) = __$SimpleUserCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String login, int id,@JsonKey(name: 'node_id') String nodeId,@JsonKey(name: 'avatar_url') String avatarUrl,@JsonKey(name: 'gravatar_id') String? gravatarId, String url,@JsonKey(name: 'html_url') String htmlUrl,@JsonKey(name: 'followers_url') String followersUrl,@JsonKey(name: 'following_url') String followingUrl,@JsonKey(name: 'gists_url') String gistsUrl,@JsonKey(name: 'starred_url') String starredUrl,@JsonKey(name: 'subscriptions_url') String subscriptionsUrl,@JsonKey(name: 'organizations_url') String organizationsUrl,@JsonKey(name: 'repos_url') String reposUrl,@JsonKey(name: 'events_url') String eventsUrl,@JsonKey(name: 'received_events_url') String receivedEventsUrl, String type,@JsonKey(name: 'site_admin') bool siteAdmin,@JsonKey(name: 'starred_at') String? starredAt,@JsonKey(name: 'user_view_type') String? userViewType
});




}
/// @nodoc
class __$SimpleUserCopyWithImpl<$Res>
    implements _$SimpleUserCopyWith<$Res> {
  __$SimpleUserCopyWithImpl(this._self, this._then);

  final _SimpleUser _self;
  final $Res Function(_SimpleUser) _then;

/// Create a copy of SimpleUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? login = null,Object? id = null,Object? nodeId = null,Object? avatarUrl = null,Object? gravatarId = freezed,Object? url = null,Object? htmlUrl = null,Object? followersUrl = null,Object? followingUrl = null,Object? gistsUrl = null,Object? starredUrl = null,Object? subscriptionsUrl = null,Object? organizationsUrl = null,Object? reposUrl = null,Object? eventsUrl = null,Object? receivedEventsUrl = null,Object? type = null,Object? siteAdmin = null,Object? starredAt = freezed,Object? userViewType = freezed,}) {
  return _then(_SimpleUser(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,gravatarId: freezed == gravatarId ? _self.gravatarId : gravatarId // ignore: cast_nullable_to_non_nullable
as String?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,followersUrl: null == followersUrl ? _self.followersUrl : followersUrl // ignore: cast_nullable_to_non_nullable
as String,followingUrl: null == followingUrl ? _self.followingUrl : followingUrl // ignore: cast_nullable_to_non_nullable
as String,gistsUrl: null == gistsUrl ? _self.gistsUrl : gistsUrl // ignore: cast_nullable_to_non_nullable
as String,starredUrl: null == starredUrl ? _self.starredUrl : starredUrl // ignore: cast_nullable_to_non_nullable
as String,subscriptionsUrl: null == subscriptionsUrl ? _self.subscriptionsUrl : subscriptionsUrl // ignore: cast_nullable_to_non_nullable
as String,organizationsUrl: null == organizationsUrl ? _self.organizationsUrl : organizationsUrl // ignore: cast_nullable_to_non_nullable
as String,reposUrl: null == reposUrl ? _self.reposUrl : reposUrl // ignore: cast_nullable_to_non_nullable
as String,eventsUrl: null == eventsUrl ? _self.eventsUrl : eventsUrl // ignore: cast_nullable_to_non_nullable
as String,receivedEventsUrl: null == receivedEventsUrl ? _self.receivedEventsUrl : receivedEventsUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,siteAdmin: null == siteAdmin ? _self.siteAdmin : siteAdmin // ignore: cast_nullable_to_non_nullable
as bool,starredAt: freezed == starredAt ? _self.starredAt : starredAt // ignore: cast_nullable_to_non_nullable
as String?,userViewType: freezed == userViewType ? _self.userViewType : userViewType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LicenseSimple {

 String get key; String get name; String? get url; String? get spdxId;@JsonKey(name: 'node_id') String get nodeId;@JsonKey(name: 'html_url') String? get htmlUrl;
/// Create a copy of LicenseSimple
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LicenseSimpleCopyWith<LicenseSimple> get copyWith => _$LicenseSimpleCopyWithImpl<LicenseSimple>(this as LicenseSimple, _$identity);

  /// Serializes this LicenseSimple to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenseSimple&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.spdxId, spdxId) || other.spdxId == spdxId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,url,spdxId,nodeId,htmlUrl);

@override
String toString() {
  return 'LicenseSimple(key: $key, name: $name, url: $url, spdxId: $spdxId, nodeId: $nodeId, htmlUrl: $htmlUrl)';
}


}

/// @nodoc
abstract mixin class $LicenseSimpleCopyWith<$Res>  {
  factory $LicenseSimpleCopyWith(LicenseSimple value, $Res Function(LicenseSimple) _then) = _$LicenseSimpleCopyWithImpl;
@useResult
$Res call({
 String key, String name, String? url, String? spdxId,@JsonKey(name: 'node_id') String nodeId,@JsonKey(name: 'html_url') String? htmlUrl
});




}
/// @nodoc
class _$LicenseSimpleCopyWithImpl<$Res>
    implements $LicenseSimpleCopyWith<$Res> {
  _$LicenseSimpleCopyWithImpl(this._self, this._then);

  final LicenseSimple _self;
  final $Res Function(LicenseSimple) _then;

/// Create a copy of LicenseSimple
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? url = freezed,Object? spdxId = freezed,Object? nodeId = null,Object? htmlUrl = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,spdxId: freezed == spdxId ? _self.spdxId : spdxId // ignore: cast_nullable_to_non_nullable
as String?,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: freezed == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LicenseSimple].
extension LicenseSimplePatterns on LicenseSimple {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LicenseSimple value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LicenseSimple() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LicenseSimple value)  $default,){
final _that = this;
switch (_that) {
case _LicenseSimple():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LicenseSimple value)?  $default,){
final _that = this;
switch (_that) {
case _LicenseSimple() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String name,  String? url,  String? spdxId, @JsonKey(name: 'node_id')  String nodeId, @JsonKey(name: 'html_url')  String? htmlUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LicenseSimple() when $default != null:
return $default(_that.key,_that.name,_that.url,_that.spdxId,_that.nodeId,_that.htmlUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String name,  String? url,  String? spdxId, @JsonKey(name: 'node_id')  String nodeId, @JsonKey(name: 'html_url')  String? htmlUrl)  $default,) {final _that = this;
switch (_that) {
case _LicenseSimple():
return $default(_that.key,_that.name,_that.url,_that.spdxId,_that.nodeId,_that.htmlUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String name,  String? url,  String? spdxId, @JsonKey(name: 'node_id')  String nodeId, @JsonKey(name: 'html_url')  String? htmlUrl)?  $default,) {final _that = this;
switch (_that) {
case _LicenseSimple() when $default != null:
return $default(_that.key,_that.name,_that.url,_that.spdxId,_that.nodeId,_that.htmlUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LicenseSimple extends LicenseSimple {
  const _LicenseSimple({required this.key, required this.name, this.url, this.spdxId, @JsonKey(name: 'node_id') required this.nodeId, @JsonKey(name: 'html_url') this.htmlUrl}): super._();
  factory _LicenseSimple.fromJson(Map<String, dynamic> json) => _$LicenseSimpleFromJson(json);

@override final  String key;
@override final  String name;
@override final  String? url;
@override final  String? spdxId;
@override@JsonKey(name: 'node_id') final  String nodeId;
@override@JsonKey(name: 'html_url') final  String? htmlUrl;

/// Create a copy of LicenseSimple
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LicenseSimpleCopyWith<_LicenseSimple> get copyWith => __$LicenseSimpleCopyWithImpl<_LicenseSimple>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LicenseSimpleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LicenseSimple&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.spdxId, spdxId) || other.spdxId == spdxId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,url,spdxId,nodeId,htmlUrl);

@override
String toString() {
  return 'LicenseSimple(key: $key, name: $name, url: $url, spdxId: $spdxId, nodeId: $nodeId, htmlUrl: $htmlUrl)';
}


}

/// @nodoc
abstract mixin class _$LicenseSimpleCopyWith<$Res> implements $LicenseSimpleCopyWith<$Res> {
  factory _$LicenseSimpleCopyWith(_LicenseSimple value, $Res Function(_LicenseSimple) _then) = __$LicenseSimpleCopyWithImpl;
@override @useResult
$Res call({
 String key, String name, String? url, String? spdxId,@JsonKey(name: 'node_id') String nodeId,@JsonKey(name: 'html_url') String? htmlUrl
});




}
/// @nodoc
class __$LicenseSimpleCopyWithImpl<$Res>
    implements _$LicenseSimpleCopyWith<$Res> {
  __$LicenseSimpleCopyWithImpl(this._self, this._then);

  final _LicenseSimple _self;
  final $Res Function(_LicenseSimple) _then;

/// Create a copy of LicenseSimple
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? url = freezed,Object? spdxId = freezed,Object? nodeId = null,Object? htmlUrl = freezed,}) {
  return _then(_LicenseSimple(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,spdxId: freezed == spdxId ? _self.spdxId : spdxId // ignore: cast_nullable_to_non_nullable
as String?,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: freezed == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Permissions {

 bool get admin; bool? get maintain; bool get push; bool? get triage; bool get pull;
/// Create a copy of Permissions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionsCopyWith<Permissions> get copyWith => _$PermissionsCopyWithImpl<Permissions>(this as Permissions, _$identity);

  /// Serializes this Permissions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Permissions&&(identical(other.admin, admin) || other.admin == admin)&&(identical(other.maintain, maintain) || other.maintain == maintain)&&(identical(other.push, push) || other.push == push)&&(identical(other.triage, triage) || other.triage == triage)&&(identical(other.pull, pull) || other.pull == pull));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admin,maintain,push,triage,pull);

@override
String toString() {
  return 'Permissions(admin: $admin, maintain: $maintain, push: $push, triage: $triage, pull: $pull)';
}


}

/// @nodoc
abstract mixin class $PermissionsCopyWith<$Res>  {
  factory $PermissionsCopyWith(Permissions value, $Res Function(Permissions) _then) = _$PermissionsCopyWithImpl;
@useResult
$Res call({
 bool admin, bool? maintain, bool push, bool? triage, bool pull
});




}
/// @nodoc
class _$PermissionsCopyWithImpl<$Res>
    implements $PermissionsCopyWith<$Res> {
  _$PermissionsCopyWithImpl(this._self, this._then);

  final Permissions _self;
  final $Res Function(Permissions) _then;

/// Create a copy of Permissions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? admin = null,Object? maintain = freezed,Object? push = null,Object? triage = freezed,Object? pull = null,}) {
  return _then(_self.copyWith(
admin: null == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as bool,maintain: freezed == maintain ? _self.maintain : maintain // ignore: cast_nullable_to_non_nullable
as bool?,push: null == push ? _self.push : push // ignore: cast_nullable_to_non_nullable
as bool,triage: freezed == triage ? _self.triage : triage // ignore: cast_nullable_to_non_nullable
as bool?,pull: null == pull ? _self.pull : pull // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Permissions].
extension PermissionsPatterns on Permissions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Permissions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Permissions() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Permissions value)  $default,){
final _that = this;
switch (_that) {
case _Permissions():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Permissions value)?  $default,){
final _that = this;
switch (_that) {
case _Permissions() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool admin,  bool? maintain,  bool push,  bool? triage,  bool pull)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Permissions() when $default != null:
return $default(_that.admin,_that.maintain,_that.push,_that.triage,_that.pull);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool admin,  bool? maintain,  bool push,  bool? triage,  bool pull)  $default,) {final _that = this;
switch (_that) {
case _Permissions():
return $default(_that.admin,_that.maintain,_that.push,_that.triage,_that.pull);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool admin,  bool? maintain,  bool push,  bool? triage,  bool pull)?  $default,) {final _that = this;
switch (_that) {
case _Permissions() when $default != null:
return $default(_that.admin,_that.maintain,_that.push,_that.triage,_that.pull);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Permissions extends Permissions {
  const _Permissions({required this.admin, this.maintain, required this.push, this.triage, required this.pull}): super._();
  factory _Permissions.fromJson(Map<String, dynamic> json) => _$PermissionsFromJson(json);

@override final  bool admin;
@override final  bool? maintain;
@override final  bool push;
@override final  bool? triage;
@override final  bool pull;

/// Create a copy of Permissions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionsCopyWith<_Permissions> get copyWith => __$PermissionsCopyWithImpl<_Permissions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PermissionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Permissions&&(identical(other.admin, admin) || other.admin == admin)&&(identical(other.maintain, maintain) || other.maintain == maintain)&&(identical(other.push, push) || other.push == push)&&(identical(other.triage, triage) || other.triage == triage)&&(identical(other.pull, pull) || other.pull == pull));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admin,maintain,push,triage,pull);

@override
String toString() {
  return 'Permissions(admin: $admin, maintain: $maintain, push: $push, triage: $triage, pull: $pull)';
}


}

/// @nodoc
abstract mixin class _$PermissionsCopyWith<$Res> implements $PermissionsCopyWith<$Res> {
  factory _$PermissionsCopyWith(_Permissions value, $Res Function(_Permissions) _then) = __$PermissionsCopyWithImpl;
@override @useResult
$Res call({
 bool admin, bool? maintain, bool push, bool? triage, bool pull
});




}
/// @nodoc
class __$PermissionsCopyWithImpl<$Res>
    implements _$PermissionsCopyWith<$Res> {
  __$PermissionsCopyWithImpl(this._self, this._then);

  final _Permissions _self;
  final $Res Function(_Permissions) _then;

/// Create a copy of Permissions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? admin = null,Object? maintain = freezed,Object? push = null,Object? triage = freezed,Object? pull = null,}) {
  return _then(_Permissions(
admin: null == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as bool,maintain: freezed == maintain ? _self.maintain : maintain // ignore: cast_nullable_to_non_nullable
as bool?,push: null == push ? _self.push : push // ignore: cast_nullable_to_non_nullable
as bool,triage: freezed == triage ? _self.triage : triage // ignore: cast_nullable_to_non_nullable
as bool?,pull: null == pull ? _self.pull : pull // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
