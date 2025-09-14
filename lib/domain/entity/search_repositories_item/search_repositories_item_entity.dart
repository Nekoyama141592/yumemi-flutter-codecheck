import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/repository_item/repository_item.dart';

part 'search_repositories_item_entity.freezed.dart';
part 'search_repositories_item_entity.g.dart';

@freezed
abstract class SearchRepositoriesItemEntity
    with _$SearchRepositoriesItemEntity {
  const SearchRepositoriesItemEntity._();
  const factory SearchRepositoriesItemEntity({
    required String fullName,
    required String htmlUrl,
    required String name,
  }) = _SearchRepositoriesItemEntity;

  factory SearchRepositoriesItemEntity.fromModel(RepositoryItem model) =>
      SearchRepositoriesItemEntity(
        fullName: model.fullName,
        htmlUrl: model.htmlUrl,
        name: model.name,
      );

  factory SearchRepositoriesItemEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoriesItemEntityFromJson(json);

  /// fullNameを'/'でsplitし、0番目の要素を返す
  String get userName => fullName.split('/').first;
}
