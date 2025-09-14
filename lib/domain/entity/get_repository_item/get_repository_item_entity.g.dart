// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repository_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetRepositoryItemEntity _$GetRepositoryItemEntityFromJson(
  Map<String, dynamic> json,
) => _GetRepositoryItemEntity(
  fullName: json['fullName'] as String,
  ownerAvatarUrl: json['ownerAvatarUrl'] as String?,
  language: json['language'] as String?,
  stargazersCount: (json['stargazersCount'] as num).toInt(),
  watchersCount: (json['watchersCount'] as num).toInt(),
  forksCount: (json['forksCount'] as num).toInt(),
  openIssuesCount: (json['openIssuesCount'] as num).toInt(),
);

Map<String, dynamic> _$GetRepositoryItemEntityToJson(
  _GetRepositoryItemEntity instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'ownerAvatarUrl': instance.ownerAvatarUrl,
  'language': instance.language,
  'stargazersCount': instance.stargazersCount,
  'watchersCount': instance.watchersCount,
  'forksCount': instance.forksCount,
  'openIssuesCount': instance.openIssuesCount,
};
