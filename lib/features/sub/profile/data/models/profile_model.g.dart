// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
      totalHabits: (json['total_habits'] as num).toInt(),
      noOfCompletes: (json['no_of_completes'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'date_of_birth': instance.dateOfBirth.toIso8601String(),
      'total_habits': instance.totalHabits,
      'no_of_completes': instance.noOfCompletes,
    };
