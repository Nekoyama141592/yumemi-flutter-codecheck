// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_repositories_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchRepositoriesItemEntity {

 String get fullName; String get htmlUrl; String get name;
/// Create a copy of SearchRepositoriesItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchRepositoriesItemEntityCopyWith<SearchRepositoriesItemEntity> get copyWith => _$SearchRepositoriesItemEntityCopyWithImpl<SearchRepositoriesItemEntity>(this as SearchRepositoriesItemEntity, _$identity);

  /// Serializes this SearchRepositoriesItemEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRepositoriesItemEntity&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,htmlUrl,name);

@override
String toString() {
  return 'SearchRepositoriesItemEntity(fullName: $fullName, htmlUrl: $htmlUrl, name: $name)';
}


}

/// @nodoc
abstract mixin class $SearchRepositoriesItemEntityCopyWith<$Res>  {
  factory $SearchRepositoriesItemEntityCopyWith(SearchRepositoriesItemEntity value, $Res Function(SearchRepositoriesItemEntity) _then) = _$SearchRepositoriesItemEntityCopyWithImpl;
@useResult
$Res call({
 String fullName, String htmlUrl, String name
});




}
/// @nodoc
class _$SearchRepositoriesItemEntityCopyWithImpl<$Res>
    implements $SearchRepositoriesItemEntityCopyWith<$Res> {
  _$SearchRepositoriesItemEntityCopyWithImpl(this._self, this._then);

  final SearchRepositoriesItemEntity _self;
  final $Res Function(SearchRepositoriesItemEntity) _then;

/// Create a copy of SearchRepositoriesItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? htmlUrl = null,Object? name = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchRepositoriesItemEntity].
extension SearchRepositoriesItemEntityPatterns on SearchRepositoriesItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchRepositoriesItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchRepositoriesItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchRepositoriesItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _SearchRepositoriesItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchRepositoriesItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SearchRepositoriesItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String htmlUrl,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchRepositoriesItemEntity() when $default != null:
return $default(_that.fullName,_that.htmlUrl,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String htmlUrl,  String name)  $default,) {final _that = this;
switch (_that) {
case _SearchRepositoriesItemEntity():
return $default(_that.fullName,_that.htmlUrl,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String htmlUrl,  String name)?  $default,) {final _that = this;
switch (_that) {
case _SearchRepositoriesItemEntity() when $default != null:
return $default(_that.fullName,_that.htmlUrl,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchRepositoriesItemEntity extends SearchRepositoriesItemEntity {
  const _SearchRepositoriesItemEntity({required this.fullName, required this.htmlUrl, required this.name}): super._();
  factory _SearchRepositoriesItemEntity.fromJson(Map<String, dynamic> json) => _$SearchRepositoriesItemEntityFromJson(json);

@override final  String fullName;
@override final  String htmlUrl;
@override final  String name;

/// Create a copy of SearchRepositoriesItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchRepositoriesItemEntityCopyWith<_SearchRepositoriesItemEntity> get copyWith => __$SearchRepositoriesItemEntityCopyWithImpl<_SearchRepositoriesItemEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchRepositoriesItemEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchRepositoriesItemEntity&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,htmlUrl,name);

@override
String toString() {
  return 'SearchRepositoriesItemEntity(fullName: $fullName, htmlUrl: $htmlUrl, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SearchRepositoriesItemEntityCopyWith<$Res> implements $SearchRepositoriesItemEntityCopyWith<$Res> {
  factory _$SearchRepositoriesItemEntityCopyWith(_SearchRepositoriesItemEntity value, $Res Function(_SearchRepositoriesItemEntity) _then) = __$SearchRepositoriesItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String htmlUrl, String name
});




}
/// @nodoc
class __$SearchRepositoriesItemEntityCopyWithImpl<$Res>
    implements _$SearchRepositoriesItemEntityCopyWith<$Res> {
  __$SearchRepositoriesItemEntityCopyWithImpl(this._self, this._then);

  final _SearchRepositoriesItemEntity _self;
  final $Res Function(_SearchRepositoriesItemEntity) _then;

/// Create a copy of SearchRepositoriesItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? htmlUrl = null,Object? name = null,}) {
  return _then(_SearchRepositoriesItemEntity(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
