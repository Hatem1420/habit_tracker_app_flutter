// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_logs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HabitLogsModel {

 String get id; String get title; String get createdAt; List<HabitLogItemModel> get habitLogs;
/// Create a copy of HabitLogsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitLogsModelCopyWith<HabitLogsModel> get copyWith => _$HabitLogsModelCopyWithImpl<HabitLogsModel>(this as HabitLogsModel, _$identity);

  /// Serializes this HabitLogsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitLogsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.habitLogs, habitLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,const DeepCollectionEquality().hash(habitLogs));

@override
String toString() {
  return 'HabitLogsModel(id: $id, title: $title, createdAt: $createdAt, habitLogs: $habitLogs)';
}


}

/// @nodoc
abstract mixin class $HabitLogsModelCopyWith<$Res>  {
  factory $HabitLogsModelCopyWith(HabitLogsModel value, $Res Function(HabitLogsModel) _then) = _$HabitLogsModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String createdAt, List<HabitLogItemModel> habitLogs
});




}
/// @nodoc
class _$HabitLogsModelCopyWithImpl<$Res>
    implements $HabitLogsModelCopyWith<$Res> {
  _$HabitLogsModelCopyWithImpl(this._self, this._then);

  final HabitLogsModel _self;
  final $Res Function(HabitLogsModel) _then;

/// Create a copy of HabitLogsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? habitLogs = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,habitLogs: null == habitLogs ? _self.habitLogs : habitLogs // ignore: cast_nullable_to_non_nullable
as List<HabitLogItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [HabitLogsModel].
extension HabitLogsModelPatterns on HabitLogsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HabitLogsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HabitLogsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HabitLogsModel value)  $default,){
final _that = this;
switch (_that) {
case _HabitLogsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HabitLogsModel value)?  $default,){
final _that = this;
switch (_that) {
case _HabitLogsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String createdAt,  List<HabitLogItemModel> habitLogs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HabitLogsModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.habitLogs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String createdAt,  List<HabitLogItemModel> habitLogs)  $default,) {final _that = this;
switch (_that) {
case _HabitLogsModel():
return $default(_that.id,_that.title,_that.createdAt,_that.habitLogs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String createdAt,  List<HabitLogItemModel> habitLogs)?  $default,) {final _that = this;
switch (_that) {
case _HabitLogsModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.habitLogs);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _HabitLogsModel implements HabitLogsModel {
  const _HabitLogsModel({required this.id, required this.title, required this.createdAt, required final  List<HabitLogItemModel> habitLogs}): _habitLogs = habitLogs;
  factory _HabitLogsModel.fromJson(Map<String, dynamic> json) => _$HabitLogsModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String createdAt;
 final  List<HabitLogItemModel> _habitLogs;
@override List<HabitLogItemModel> get habitLogs {
  if (_habitLogs is EqualUnmodifiableListView) return _habitLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_habitLogs);
}


/// Create a copy of HabitLogsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitLogsModelCopyWith<_HabitLogsModel> get copyWith => __$HabitLogsModelCopyWithImpl<_HabitLogsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HabitLogsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitLogsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._habitLogs, _habitLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt,const DeepCollectionEquality().hash(_habitLogs));

@override
String toString() {
  return 'HabitLogsModel(id: $id, title: $title, createdAt: $createdAt, habitLogs: $habitLogs)';
}


}

/// @nodoc
abstract mixin class _$HabitLogsModelCopyWith<$Res> implements $HabitLogsModelCopyWith<$Res> {
  factory _$HabitLogsModelCopyWith(_HabitLogsModel value, $Res Function(_HabitLogsModel) _then) = __$HabitLogsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String createdAt, List<HabitLogItemModel> habitLogs
});




}
/// @nodoc
class __$HabitLogsModelCopyWithImpl<$Res>
    implements _$HabitLogsModelCopyWith<$Res> {
  __$HabitLogsModelCopyWithImpl(this._self, this._then);

  final _HabitLogsModel _self;
  final $Res Function(_HabitLogsModel) _then;

/// Create a copy of HabitLogsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? habitLogs = null,}) {
  return _then(_HabitLogsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,habitLogs: null == habitLogs ? _self._habitLogs : habitLogs // ignore: cast_nullable_to_non_nullable
as List<HabitLogItemModel>,
  ));
}


}

// dart format on
