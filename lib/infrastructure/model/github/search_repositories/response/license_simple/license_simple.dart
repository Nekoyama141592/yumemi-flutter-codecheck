import 'package:freezed_annotation/freezed_annotation.dart';

part 'license_simple.freezed.dart';
part 'license_simple.g.dart';

@freezed
abstract class LicenseSimple with _$LicenseSimple {
  const LicenseSimple._();
  const factory LicenseSimple({
    required String key,
    required String name,
    String? url,
    String? spdxId,
    @JsonKey(name: 'node_id') required String nodeId,
    @JsonKey(name: 'html_url') String? htmlUrl,
  }) = _LicenseSimple;

  factory LicenseSimple.fromJson(Map<String, dynamic> json) =>
      _$LicenseSimpleFromJson(json);
}

