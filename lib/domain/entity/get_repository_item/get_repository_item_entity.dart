import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/model/github/search_repositories/response/repository_item/repository_item.dart';

part 'get_repository_item_entity.freezed.dart';
part 'get_repository_item_entity.g.dart';

@freezed
abstract class GetRepositoryItemEntity with _$GetRepositoryItemEntity {
  const GetRepositoryItemEntity._();

  const factory GetRepositoryItemEntity({
    required String fullName,
    String? ownerAvatarUrl,
    String? language,
    required int stargazersCount,
    required int watchersCount,
    required int forksCount,
    required int openIssuesCount,
  }) = _GetRepositoryItemEntity;

  factory GetRepositoryItemEntity.fromModel(RepositoryItem model) =>
      GetRepositoryItemEntity(
        fullName: model.fullName,
        ownerAvatarUrl: model.owner?.avatarUrl,
        language: model.language,
        stargazersCount: model.stargazersCount,
        watchersCount: model.watchersCount,
        forksCount: model.forksCount,
        openIssuesCount: model.openIssuesCount,
      );

  factory GetRepositoryItemEntity.fromJson(Map<String, dynamic> json) =>
      _$GetRepositoryItemEntityFromJson(json);
}
