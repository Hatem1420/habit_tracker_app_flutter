// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habits_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HabitsModel {

 String get id; String get title; String get createdAt;
/// Create a copy of HabitsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitsModelCopyWith<HabitsModel> get copyWith => _$HabitsModelCopyWithImpl<HabitsModel>(this as HabitsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt);

@override
String toString() {
  return 'HabitsModel(id: $id, title: $title, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $HabitsModelCopyWith<$Res>  {
  factory $HabitsModelCopyWith(HabitsModel value, $Res Function(HabitsModel) _then) = _$HabitsModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String createdAt
});




}
/// @nodoc
class _$HabitsModelCopyWithImpl<$Res>
    implements $HabitsModelCopyWith<$Res> {
  _$HabitsModelCopyWithImpl(this._self, this._then);

  final HabitsModel _self;
  final $Res Function(HabitsModel) _then;

/// Create a copy of HabitsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HabitsModel].
extension HabitsModelPatterns on HabitsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HabitsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HabitsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HabitsModel value)  $default,){
final _that = this;
switch (_that) {
case _HabitsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HabitsModel value)?  $default,){
final _that = this;
switch (_that) {
case _HabitsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HabitsModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _HabitsModel():
return $default(_that.id,_that.title,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _HabitsModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _HabitsModel implements HabitsModel {
  const _HabitsModel({required this.id, required this.title, required this.createdAt});
  

@override final  String id;
@override final  String title;
@override final  String createdAt;

/// Create a copy of HabitsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitsModelCopyWith<_HabitsModel> get copyWith => __$HabitsModelCopyWithImpl<_HabitsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt);

@override
String toString() {
  return 'HabitsModel(id: $id, title: $title, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$HabitsModelCopyWith<$Res> implements $HabitsModelCopyWith<$Res> {
  factory _$HabitsModelCopyWith(_HabitsModel value, $Res Function(_HabitsModel) _then) = __$HabitsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String createdAt
});




}
/// @nodoc
class __$HabitsModelCopyWithImpl<$Res>
    implements _$HabitsModelCopyWith<$Res> {
  __$HabitsModelCopyWithImpl(this._self, this._then);

  final _HabitsModel _self;
  final $Res Function(_HabitsModel) _then;

/// Create a copy of HabitsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? createdAt = null,}) {
  return _then(_HabitsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
