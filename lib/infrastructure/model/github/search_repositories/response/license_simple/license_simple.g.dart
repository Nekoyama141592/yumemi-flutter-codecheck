// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_simple.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LicenseSimple _$LicenseSimpleFromJson(Map<String, dynamic> json) =>
    _LicenseSimple(
      key: json['key'] as String,
      name: json['name'] as String,
      url: json['url'] as String?,
      spdxId: json['spdxId'] as String?,
      nodeId: json['node_id'] as String,
      htmlUrl: json['html_url'] as String?,
    );

Map<String, dynamic> _$LicenseSimpleToJson(_LicenseSimple instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'url': instance.url,
      'spdxId': instance.spdxId,
      'node_id': instance.nodeId,
      'html_url': instance.htmlUrl,
    };
