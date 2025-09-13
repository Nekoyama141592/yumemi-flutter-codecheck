import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_repositories_item_entity.freezed.dart';
part 'search_repositories_item_entity.g.dart';

@freezed
abstract class SearchRepositoriesItemEntity
    with _$SearchRepositoriesItemEntity {
  const SearchRepositoriesItemEntity._();
  const factory SearchRepositoriesItemEntity({
    required int id,
    required String fullName,
    required String htmlUrl,
  }) = _SearchRepositoriesItemEntity;

  factory SearchRepositoriesItemEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoriesItemEntityFromJson(json);
}
