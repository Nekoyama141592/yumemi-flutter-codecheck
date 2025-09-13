// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repositories_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchRepositoriesRequest _$SearchRepositoriesRequestFromJson(
  Map<String, dynamic> json,
) => _SearchRepositoriesRequest(
  q: json['q'] as String,
  sort: json['sort'] as String?,
  order: json['order'] as String?,
  perPage: (json['perPage'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
);

Map<String, dynamic> _$SearchRepositoriesRequestToJson(
  _SearchRepositoriesRequest instance,
) => <String, dynamic>{
  'q': instance.q,
  'sort': instance.sort,
  'order': instance.order,
  'perPage': instance.perPage,
  'page': instance.page,
};
