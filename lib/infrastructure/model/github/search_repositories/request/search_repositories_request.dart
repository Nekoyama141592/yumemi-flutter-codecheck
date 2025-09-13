import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_repositories_request.freezed.dart';
part 'search_repositories_request.g.dart';

@freezed
abstract class SearchRepositoriesRequest with _$SearchRepositoriesRequest {
  const SearchRepositoriesRequest._();
  @JsonSerializable(includeIfNull: false)
  const factory SearchRepositoriesRequest({
    required String q,
    String? sort,
    String? order,
    @JsonKey(name: 'per_page') int? perPage,
    int? page,
  }) = _SearchRepositoriesRequest;

  factory SearchRepositoriesRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoriesRequestFromJson(json);
}
