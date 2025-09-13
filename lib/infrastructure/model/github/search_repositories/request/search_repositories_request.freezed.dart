// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_repositories_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchRepositoriesRequest {

 String get q; String? get sort; String? get order;@JsonKey(name: 'per_page') int? get perPage; int? get page;
/// Create a copy of SearchRepositoriesRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchRepositoriesRequestCopyWith<SearchRepositoriesRequest> get copyWith => _$SearchRepositoriesRequestCopyWithImpl<SearchRepositoriesRequest>(this as SearchRepositoriesRequest, _$identity);

  /// Serializes this SearchRepositoriesRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRepositoriesRequest&&(identical(other.q, q) || other.q == q)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,q,sort,order,perPage,page);

@override
String toString() {
  return 'SearchRepositoriesRequest(q: $q, sort: $sort, order: $order, perPage: $perPage, page: $page)';
}


}

/// @nodoc
abstract mixin class $SearchRepositoriesRequestCopyWith<$Res>  {
  factory $SearchRepositoriesRequestCopyWith(SearchRepositoriesRequest value, $Res Function(SearchRepositoriesRequest) _then) = _$SearchRepositoriesRequestCopyWithImpl;
@useResult
$Res call({
 String q, String? sort, String? order,@JsonKey(name: 'per_page') int? perPage, int? page
});




}
/// @nodoc
class _$SearchRepositoriesRequestCopyWithImpl<$Res>
    implements $SearchRepositoriesRequestCopyWith<$Res> {
  _$SearchRepositoriesRequestCopyWithImpl(this._self, this._then);

  final SearchRepositoriesRequest _self;
  final $Res Function(SearchRepositoriesRequest) _then;

/// Create a copy of SearchRepositoriesRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? q = null,Object? sort = freezed,Object? order = freezed,Object? perPage = freezed,Object? page = freezed,}) {
  return _then(_self.copyWith(
q: null == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as String,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as String?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchRepositoriesRequest].
extension SearchRepositoriesRequestPatterns on SearchRepositoriesRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchRepositoriesRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchRepositoriesRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchRepositoriesRequest value)  $default,){
final _that = this;
switch (_that) {
case _SearchRepositoriesRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchRepositoriesRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SearchRepositoriesRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String q,  String? sort,  String? order, @JsonKey(name: 'per_page')  int? perPage,  int? page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchRepositoriesRequest() when $default != null:
return $default(_that.q,_that.sort,_that.order,_that.perPage,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String q,  String? sort,  String? order, @JsonKey(name: 'per_page')  int? perPage,  int? page)  $default,) {final _that = this;
switch (_that) {
case _SearchRepositoriesRequest():
return $default(_that.q,_that.sort,_that.order,_that.perPage,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String q,  String? sort,  String? order, @JsonKey(name: 'per_page')  int? perPage,  int? page)?  $default,) {final _that = this;
switch (_that) {
case _SearchRepositoriesRequest() when $default != null:
return $default(_that.q,_that.sort,_that.order,_that.perPage,_that.page);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _SearchRepositoriesRequest extends SearchRepositoriesRequest {
  const _SearchRepositoriesRequest({required this.q, this.sort, this.order, @JsonKey(name: 'per_page') this.perPage, this.page}): super._();
  factory _SearchRepositoriesRequest.fromJson(Map<String, dynamic> json) => _$SearchRepositoriesRequestFromJson(json);

@override final  String q;
@override final  String? sort;
@override final  String? order;
@override@JsonKey(name: 'per_page') final  int? perPage;
@override final  int? page;

/// Create a copy of SearchRepositoriesRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchRepositoriesRequestCopyWith<_SearchRepositoriesRequest> get copyWith => __$SearchRepositoriesRequestCopyWithImpl<_SearchRepositoriesRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchRepositoriesRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchRepositoriesRequest&&(identical(other.q, q) || other.q == q)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.order, order) || other.order == order)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,q,sort,order,perPage,page);

@override
String toString() {
  return 'SearchRepositoriesRequest(q: $q, sort: $sort, order: $order, perPage: $perPage, page: $page)';
}


}

/// @nodoc
abstract mixin class _$SearchRepositoriesRequestCopyWith<$Res> implements $SearchRepositoriesRequestCopyWith<$Res> {
  factory _$SearchRepositoriesRequestCopyWith(_SearchRepositoriesRequest value, $Res Function(_SearchRepositoriesRequest) _then) = __$SearchRepositoriesRequestCopyWithImpl;
@override @useResult
$Res call({
 String q, String? sort, String? order,@JsonKey(name: 'per_page') int? perPage, int? page
});




}
/// @nodoc
class __$SearchRepositoriesRequestCopyWithImpl<$Res>
    implements _$SearchRepositoriesRequestCopyWith<$Res> {
  __$SearchRepositoriesRequestCopyWithImpl(this._self, this._then);

  final _SearchRepositoriesRequest _self;
  final $Res Function(_SearchRepositoriesRequest) _then;

/// Create a copy of SearchRepositoriesRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? q = null,Object? sort = freezed,Object? order = freezed,Object? perPage = freezed,Object? page = freezed,}) {
  return _then(_SearchRepositoriesRequest(
q: null == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as String,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as String?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
