import 'package:personal_habit_tracker_app/features/habits/domain/entities/habits_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'habits_model.freezed.dart';
part 'habits_model.g.dart';

@freezed
abstract class HabitsModel with _$HabitsModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory HabitsModel({
    required String id,
    required String title,
    String? habitColor,
    required String createdAt,
  }) = _HabitsModel;

  factory HabitsModel.fromJson(Map<String, Object?> json) =>
      _$HabitsModelFromJson(json);
}

extension HabitsModelMapper on HabitsModel {
  HabitsEntity toEntity() {
    return HabitsEntity(
      id: id,
      title: title,
      createdAt: createdAt,
      habitColor: habitColor,
    );
  }
}
