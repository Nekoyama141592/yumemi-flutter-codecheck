// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license_simple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LicenseSimple {

 String get key; String get name; String? get url; String? get spdxId;@JsonKey(name: 'node_id') String get nodeId;@JsonKey(name: 'html_url') String? get htmlUrl;
/// Create a copy of LicenseSimple
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LicenseSimpleCopyWith<LicenseSimple> get copyWith => _$LicenseSimpleCopyWithImpl<LicenseSimple>(this as LicenseSimple, _$identity);

  /// Serializes this LicenseSimple to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenseSimple&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.spdxId, spdxId) || other.spdxId == spdxId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,url,spdxId,nodeId,htmlUrl);

@override
String toString() {
  return 'LicenseSimple(key: $key, name: $name, url: $url, spdxId: $spdxId, nodeId: $nodeId, htmlUrl: $htmlUrl)';
}


}

/// @nodoc
abstract mixin class $LicenseSimpleCopyWith<$Res>  {
  factory $LicenseSimpleCopyWith(LicenseSimple value, $Res Function(LicenseSimple) _then) = _$LicenseSimpleCopyWithImpl;
@useResult
$Res call({
 String key, String name, String? url, String? spdxId,@JsonKey(name: 'node_id') String nodeId,@JsonKey(name: 'html_url') String? htmlUrl
});




}
/// @nodoc
class _$LicenseSimpleCopyWithImpl<$Res>
    implements $LicenseSimpleCopyWith<$Res> {
  _$LicenseSimpleCopyWithImpl(this._self, this._then);

  final LicenseSimple _self;
  final $Res Function(LicenseSimple) _then;

/// Create a copy of LicenseSimple
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? url = freezed,Object? spdxId = freezed,Object? nodeId = null,Object? htmlUrl = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,spdxId: freezed == spdxId ? _self.spdxId : spdxId // ignore: cast_nullable_to_non_nullable
as String?,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: freezed == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LicenseSimple].
extension LicenseSimplePatterns on LicenseSimple {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LicenseSimple value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LicenseSimple() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LicenseSimple value)  $default,){
final _that = this;
switch (_that) {
case _LicenseSimple():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LicenseSimple value)?  $default,){
final _that = this;
switch (_that) {
case _LicenseSimple() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String name,  String? url,  String? spdxId, @JsonKey(name: 'node_id')  String nodeId, @JsonKey(name: 'html_url')  String? htmlUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LicenseSimple() when $default != null:
return $default(_that.key,_that.name,_that.url,_that.spdxId,_that.nodeId,_that.htmlUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String name,  String? url,  String? spdxId, @JsonKey(name: 'node_id')  String nodeId, @JsonKey(name: 'html_url')  String? htmlUrl)  $default,) {final _that = this;
switch (_that) {
case _LicenseSimple():
return $default(_that.key,_that.name,_that.url,_that.spdxId,_that.nodeId,_that.htmlUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String name,  String? url,  String? spdxId, @JsonKey(name: 'node_id')  String nodeId, @JsonKey(name: 'html_url')  String? htmlUrl)?  $default,) {final _that = this;
switch (_that) {
case _LicenseSimple() when $default != null:
return $default(_that.key,_that.name,_that.url,_that.spdxId,_that.nodeId,_that.htmlUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LicenseSimple extends LicenseSimple {
  const _LicenseSimple({required this.key, required this.name, this.url, this.spdxId, @JsonKey(name: 'node_id') required this.nodeId, @JsonKey(name: 'html_url') this.htmlUrl}): super._();
  factory _LicenseSimple.fromJson(Map<String, dynamic> json) => _$LicenseSimpleFromJson(json);

@override final  String key;
@override final  String name;
@override final  String? url;
@override final  String? spdxId;
@override@JsonKey(name: 'node_id') final  String nodeId;
@override@JsonKey(name: 'html_url') final  String? htmlUrl;

/// Create a copy of LicenseSimple
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LicenseSimpleCopyWith<_LicenseSimple> get copyWith => __$LicenseSimpleCopyWithImpl<_LicenseSimple>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LicenseSimpleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LicenseSimple&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.spdxId, spdxId) || other.spdxId == spdxId)&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,url,spdxId,nodeId,htmlUrl);

@override
String toString() {
  return 'LicenseSimple(key: $key, name: $name, url: $url, spdxId: $spdxId, nodeId: $nodeId, htmlUrl: $htmlUrl)';
}


}

/// @nodoc
abstract mixin class _$LicenseSimpleCopyWith<$Res> implements $LicenseSimpleCopyWith<$Res> {
  factory _$LicenseSimpleCopyWith(_LicenseSimple value, $Res Function(_LicenseSimple) _then) = __$LicenseSimpleCopyWithImpl;
@override @useResult
$Res call({
 String key, String name, String? url, String? spdxId,@JsonKey(name: 'node_id') String nodeId,@JsonKey(name: 'html_url') String? htmlUrl
});




}
/// @nodoc
class __$LicenseSimpleCopyWithImpl<$Res>
    implements _$LicenseSimpleCopyWith<$Res> {
  __$LicenseSimpleCopyWithImpl(this._self, this._then);

  final _LicenseSimple _self;
  final $Res Function(_LicenseSimple) _then;

/// Create a copy of LicenseSimple
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? url = freezed,Object? spdxId = freezed,Object? nodeId = null,Object? htmlUrl = freezed,}) {
  return _then(_LicenseSimple(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,spdxId: freezed == spdxId ? _self.spdxId : spdxId // ignore: cast_nullable_to_non_nullable
as String?,nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: freezed == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
