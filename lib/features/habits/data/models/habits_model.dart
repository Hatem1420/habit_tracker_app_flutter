import 'package:personal_habit_tracker_app/features/habits/domain/entities/habits_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'habits_model.freezed.dart';

@freezed
abstract class HabitsModel with _$HabitsModel {
  const factory HabitsModel({
    required String id,
    required String title,
    required String createdAt,
  }) = _HabitsModel;

  factory HabitsModel.fromJson(Map<String, Object?> json) {
     try{
      return HabitsModel(
      id: json['id'] as String, 
      title: json['title'] as String, 
      createdAt: json['created_at'] as String,);
    }
catch (e) {
      rethrow;
  }
}
}



extension HabitsModelMapper on HabitsModel {
  HabitsEntity toEntity() {
    return HabitsEntity(id: id, title: title, createdAt: createdAt);
  }
  }
