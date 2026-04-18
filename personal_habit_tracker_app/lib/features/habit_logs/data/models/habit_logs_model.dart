import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/data/models/habit_log_item_model.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/domain/entities/habit_logs_entity.dart';

part 'habit_logs_model.freezed.dart';
part 'habit_logs_model.g.dart';

@freezed
abstract class HabitLogsModel with _$HabitLogsModel {
    // ignore: invalid_annotation_target
    @JsonSerializable(fieldRename: .snake) 
  const factory HabitLogsModel({
    required String id,
    required String title,
    required String createdAt,
    required List<HabitLogItemModel> habitLogs,
  }) = _HabitLogsModel;

  factory HabitLogsModel.fromJson(Map<String, dynamic> json) =>
      _$HabitLogsModelFromJson(json);
}

extension HabitLogsModelMapper on HabitLogsModel {
  HabitLogsEntity toEntity() {
    return HabitLogsEntity(
      id: id,
      title: title,
      createdAt: createdAt,

      habitLogs: habitLogs.map((e) => e.toEntity()).toList(),
    );
  }
}
