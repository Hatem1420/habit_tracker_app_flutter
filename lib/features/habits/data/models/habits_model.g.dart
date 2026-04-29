// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HabitsModel _$HabitsModelFromJson(Map<String, dynamic> json) => _HabitsModel(
  id: json['id'] as String,
  title: json['title'] as String,
  habitColor: json['habit_color'] as String?,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$HabitsModelToJson(_HabitsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'habit_color': instance.habitColor,
      'created_at': instance.createdAt,
    };
