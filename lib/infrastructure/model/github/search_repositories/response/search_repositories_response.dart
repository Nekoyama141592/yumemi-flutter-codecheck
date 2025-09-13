import 'package:freezed_annotation/freezed_annotation.dart';
import 'repository_item/repository_item.dart';

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
