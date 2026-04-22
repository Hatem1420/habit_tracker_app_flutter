import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/domain/entities/habit_log_item_entity.dart';

part 'habit_log_item_model.freezed.dart';
part 'habit_log_item_model.g.dart';

@freezed
abstract class HabitLogItemModel with _$HabitLogItemModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HabitLogItemModel({
    required int id,
    required String habitId,
    required String logDate,
    required bool isCompleted,
  }) = _HabitLogItemModel;

  factory HabitLogItemModel.fromJson(Map<String, dynamic> json) =>
      _$HabitLogItemModelFromJson(json);
}

extension HabitLogItemModelMapper on HabitLogItemModel {
  HabitLogItemEntity toEntity() {
    return HabitLogItemEntity(
      id: id,
      habitId: habitId,
      logDate: logDate,
      isCompleted: isCompleted,
    );
  }
}