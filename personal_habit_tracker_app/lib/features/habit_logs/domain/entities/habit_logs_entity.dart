import 'package:equatable/equatable.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/domain/entities/habit_log_item_entity.dart';

class HabitLogsEntity extends Equatable {
  final String id;
  final String title;
  final String createdAt;
  final List<HabitLogItemEntity> habitLogs;

  const HabitLogsEntity({
    required this.id,
    required this.title,
    required this.habitLogs,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, habitLogs];
}
