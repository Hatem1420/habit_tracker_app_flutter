// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_logs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HabitLogsModel _$HabitLogsModelFromJson(Map<String, dynamic> json) =>
    _HabitLogsModel(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: json['created_at'] as String,
      habitLogs: (json['habit_logs'] as List<dynamic>)
          .map((e) => HabitLogItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HabitLogsModelToJson(_HabitLogsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'created_at': instance.createdAt,
      'habit_logs': instance.habitLogs,
    };
