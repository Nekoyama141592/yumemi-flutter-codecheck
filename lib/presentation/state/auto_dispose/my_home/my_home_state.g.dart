// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyHomeState _$MyHomeStateFromJson(Map<String, dynamic> json) => _MyHomeState(
  repositories: (json['repositories'] as List<dynamic>)
      .map(
        (e) => SearchRepositoriesItemEntity.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  token: json['token'] as String?,
);

Map<String, dynamic> _$MyHomeStateToJson(_MyHomeState instance) =>
    <String, dynamic>{
      'repositories': instance.repositories,
      'token': instance.token,
    };
