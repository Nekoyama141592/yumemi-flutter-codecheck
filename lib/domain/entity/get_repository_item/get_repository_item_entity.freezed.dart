// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_repository_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetRepositoryItemEntity {

 String get fullName; String get htmlUrl; String? get ownerAvatarUrl; String? get language; int get stargazersCount; int get watchersCount; int get forksCount; int get openIssuesCount;
/// Create a copy of GetRepositoryItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetRepositoryItemEntityCopyWith<GetRepositoryItemEntity> get copyWith => _$GetRepositoryItemEntityCopyWithImpl<GetRepositoryItemEntity>(this as GetRepositoryItemEntity, _$identity);

  /// Serializes this GetRepositoryItemEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetRepositoryItemEntity&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.ownerAvatarUrl, ownerAvatarUrl) || other.ownerAvatarUrl == ownerAvatarUrl)&&(identical(other.language, language) || other.language == language)&&(identical(other.stargazersCount, stargazersCount) || other.stargazersCount == stargazersCount)&&(identical(other.watchersCount, watchersCount) || other.watchersCount == watchersCount)&&(identical(other.forksCount, forksCount) || other.forksCount == forksCount)&&(identical(other.openIssuesCount, openIssuesCount) || other.openIssuesCount == openIssuesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,htmlUrl,ownerAvatarUrl,language,stargazersCount,watchersCount,forksCount,openIssuesCount);

@override
String toString() {
  return 'GetRepositoryItemEntity(fullName: $fullName, htmlUrl: $htmlUrl, ownerAvatarUrl: $ownerAvatarUrl, language: $language, stargazersCount: $stargazersCount, watchersCount: $watchersCount, forksCount: $forksCount, openIssuesCount: $openIssuesCount)';
}


}

/// @nodoc
abstract mixin class $GetRepositoryItemEntityCopyWith<$Res>  {
  factory $GetRepositoryItemEntityCopyWith(GetRepositoryItemEntity value, $Res Function(GetRepositoryItemEntity) _then) = _$GetRepositoryItemEntityCopyWithImpl;
@useResult
$Res call({
 String fullName, String htmlUrl, String? ownerAvatarUrl, String? language, int stargazersCount, int watchersCount, int forksCount, int openIssuesCount
});




}
/// @nodoc
class _$GetRepositoryItemEntityCopyWithImpl<$Res>
    implements $GetRepositoryItemEntityCopyWith<$Res> {
  _$GetRepositoryItemEntityCopyWithImpl(this._self, this._then);

  final GetRepositoryItemEntity _self;
  final $Res Function(GetRepositoryItemEntity) _then;

/// Create a copy of GetRepositoryItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? htmlUrl = null,Object? ownerAvatarUrl = freezed,Object? language = freezed,Object? stargazersCount = null,Object? watchersCount = null,Object? forksCount = null,Object? openIssuesCount = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,ownerAvatarUrl: freezed == ownerAvatarUrl ? _self.ownerAvatarUrl : ownerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,stargazersCount: null == stargazersCount ? _self.stargazersCount : stargazersCount // ignore: cast_nullable_to_non_nullable
as int,watchersCount: null == watchersCount ? _self.watchersCount : watchersCount // ignore: cast_nullable_to_non_nullable
as int,forksCount: null == forksCount ? _self.forksCount : forksCount // ignore: cast_nullable_to_non_nullable
as int,openIssuesCount: null == openIssuesCount ? _self.openIssuesCount : openIssuesCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GetRepositoryItemEntity].
extension GetRepositoryItemEntityPatterns on GetRepositoryItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetRepositoryItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetRepositoryItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetRepositoryItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _GetRepositoryItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetRepositoryItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GetRepositoryItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String htmlUrl,  String? ownerAvatarUrl,  String? language,  int stargazersCount,  int watchersCount,  int forksCount,  int openIssuesCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetRepositoryItemEntity() when $default != null:
return $default(_that.fullName,_that.htmlUrl,_that.ownerAvatarUrl,_that.language,_that.stargazersCount,_that.watchersCount,_that.forksCount,_that.openIssuesCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String htmlUrl,  String? ownerAvatarUrl,  String? language,  int stargazersCount,  int watchersCount,  int forksCount,  int openIssuesCount)  $default,) {final _that = this;
switch (_that) {
case _GetRepositoryItemEntity():
return $default(_that.fullName,_that.htmlUrl,_that.ownerAvatarUrl,_that.language,_that.stargazersCount,_that.watchersCount,_that.forksCount,_that.openIssuesCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String htmlUrl,  String? ownerAvatarUrl,  String? language,  int stargazersCount,  int watchersCount,  int forksCount,  int openIssuesCount)?  $default,) {final _that = this;
switch (_that) {
case _GetRepositoryItemEntity() when $default != null:
return $default(_that.fullName,_that.htmlUrl,_that.ownerAvatarUrl,_that.language,_that.stargazersCount,_that.watchersCount,_that.forksCount,_that.openIssuesCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetRepositoryItemEntity extends GetRepositoryItemEntity {
  const _GetRepositoryItemEntity({required this.fullName, required this.htmlUrl, this.ownerAvatarUrl, this.language, required this.stargazersCount, required this.watchersCount, required this.forksCount, required this.openIssuesCount}): super._();
  factory _GetRepositoryItemEntity.fromJson(Map<String, dynamic> json) => _$GetRepositoryItemEntityFromJson(json);

@override final  String fullName;
@override final  String htmlUrl;
@override final  String? ownerAvatarUrl;
@override final  String? language;
@override final  int stargazersCount;
@override final  int watchersCount;
@override final  int forksCount;
@override final  int openIssuesCount;

/// Create a copy of GetRepositoryItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetRepositoryItemEntityCopyWith<_GetRepositoryItemEntity> get copyWith => __$GetRepositoryItemEntityCopyWithImpl<_GetRepositoryItemEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetRepositoryItemEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetRepositoryItemEntity&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.ownerAvatarUrl, ownerAvatarUrl) || other.ownerAvatarUrl == ownerAvatarUrl)&&(identical(other.language, language) || other.language == language)&&(identical(other.stargazersCount, stargazersCount) || other.stargazersCount == stargazersCount)&&(identical(other.watchersCount, watchersCount) || other.watchersCount == watchersCount)&&(identical(other.forksCount, forksCount) || other.forksCount == forksCount)&&(identical(other.openIssuesCount, openIssuesCount) || other.openIssuesCount == openIssuesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,htmlUrl,ownerAvatarUrl,language,stargazersCount,watchersCount,forksCount,openIssuesCount);

@override
String toString() {
  return 'GetRepositoryItemEntity(fullName: $fullName, htmlUrl: $htmlUrl, ownerAvatarUrl: $ownerAvatarUrl, language: $language, stargazersCount: $stargazersCount, watchersCount: $watchersCount, forksCount: $forksCount, openIssuesCount: $openIssuesCount)';
}


}

/// @nodoc
abstract mixin class _$GetRepositoryItemEntityCopyWith<$Res> implements $GetRepositoryItemEntityCopyWith<$Res> {
  factory _$GetRepositoryItemEntityCopyWith(_GetRepositoryItemEntity value, $Res Function(_GetRepositoryItemEntity) _then) = __$GetRepositoryItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String htmlUrl, String? ownerAvatarUrl, String? language, int stargazersCount, int watchersCount, int forksCount, int openIssuesCount
});




}
/// @nodoc
class __$GetRepositoryItemEntityCopyWithImpl<$Res>
    implements _$GetRepositoryItemEntityCopyWith<$Res> {
  __$GetRepositoryItemEntityCopyWithImpl(this._self, this._then);

  final _GetRepositoryItemEntity _self;
  final $Res Function(_GetRepositoryItemEntity) _then;

/// Create a copy of GetRepositoryItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? htmlUrl = null,Object? ownerAvatarUrl = freezed,Object? language = freezed,Object? stargazersCount = null,Object? watchersCount = null,Object? forksCount = null,Object? openIssuesCount = null,}) {
  return _then(_GetRepositoryItemEntity(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,ownerAvatarUrl: freezed == ownerAvatarUrl ? _self.ownerAvatarUrl : ownerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,stargazersCount: null == stargazersCount ? _self.stargazersCount : stargazersCount // ignore: cast_nullable_to_non_nullable
as int,watchersCount: null == watchersCount ? _self.watchersCount : watchersCount // ignore: cast_nullable_to_non_nullable
as int,forksCount: null == forksCount ? _self.forksCount : forksCount // ignore: cast_nullable_to_non_nullable
as int,openIssuesCount: null == openIssuesCount ? _self.openIssuesCount : openIssuesCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
