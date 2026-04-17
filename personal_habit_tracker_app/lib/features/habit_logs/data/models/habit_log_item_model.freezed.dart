// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_log_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HabitLogItemModel {

 int get id; String get habitId; String get logDate; bool get isCompleted;
/// Create a copy of HabitLogItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitLogItemModelCopyWith<HabitLogItemModel> get copyWith => _$HabitLogItemModelCopyWithImpl<HabitLogItemModel>(this as HabitLogItemModel, _$identity);

  /// Serializes this HabitLogItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitLogItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,habitId,logDate,isCompleted);

@override
String toString() {
  return 'HabitLogItemModel(id: $id, habitId: $habitId, logDate: $logDate, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $HabitLogItemModelCopyWith<$Res>  {
  factory $HabitLogItemModelCopyWith(HabitLogItemModel value, $Res Function(HabitLogItemModel) _then) = _$HabitLogItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String habitId, String logDate, bool isCompleted
});




}
/// @nodoc
class _$HabitLogItemModelCopyWithImpl<$Res>
    implements $HabitLogItemModelCopyWith<$Res> {
  _$HabitLogItemModelCopyWithImpl(this._self, this._then);

  final HabitLogItemModel _self;
  final $Res Function(HabitLogItemModel) _then;

/// Create a copy of HabitLogItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? habitId = null,Object? logDate = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HabitLogItemModel].
extension HabitLogItemModelPatterns on HabitLogItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HabitLogItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HabitLogItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HabitLogItemModel value)  $default,){
final _that = this;
switch (_that) {
case _HabitLogItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HabitLogItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _HabitLogItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String habitId,  String logDate,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HabitLogItemModel() when $default != null:
return $default(_that.id,_that.habitId,_that.logDate,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String habitId,  String logDate,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _HabitLogItemModel():
return $default(_that.id,_that.habitId,_that.logDate,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String habitId,  String logDate,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _HabitLogItemModel() when $default != null:
return $default(_that.id,_that.habitId,_that.logDate,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _HabitLogItemModel implements HabitLogItemModel {
  const _HabitLogItemModel({required this.id, required this.habitId, required this.logDate, required this.isCompleted});
  factory _HabitLogItemModel.fromJson(Map<String, dynamic> json) => _$HabitLogItemModelFromJson(json);

@override final  int id;
@override final  String habitId;
@override final  String logDate;
@override final  bool isCompleted;

/// Create a copy of HabitLogItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitLogItemModelCopyWith<_HabitLogItemModel> get copyWith => __$HabitLogItemModelCopyWithImpl<_HabitLogItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HabitLogItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitLogItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,habitId,logDate,isCompleted);

@override
String toString() {
  return 'HabitLogItemModel(id: $id, habitId: $habitId, logDate: $logDate, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$HabitLogItemModelCopyWith<$Res> implements $HabitLogItemModelCopyWith<$Res> {
  factory _$HabitLogItemModelCopyWith(_HabitLogItemModel value, $Res Function(_HabitLogItemModel) _then) = __$HabitLogItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String habitId, String logDate, bool isCompleted
});




}
/// @nodoc
class __$HabitLogItemModelCopyWithImpl<$Res>
    implements _$HabitLogItemModelCopyWith<$Res> {
  __$HabitLogItemModelCopyWithImpl(this._self, this._then);

  final _HabitLogItemModel _self;
  final $Res Function(_HabitLogItemModel) _then;

/// Create a copy of HabitLogItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? habitId = null,Object? logDate = null,Object? isCompleted = null,}) {
  return _then(_HabitLogItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
