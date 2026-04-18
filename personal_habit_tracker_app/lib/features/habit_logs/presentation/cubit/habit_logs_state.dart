import 'package:equatable/equatable.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/domain/entities/habit_logs_entity.dart';

abstract class HabitLogsState extends Equatable {
  const HabitLogsState();

  @override
  List<Object?> get props => [];
}

class HabitLogsInitial extends HabitLogsState {}

class HabitLogsLoading extends HabitLogsState {}

class HabitLogsSuccess extends HabitLogsState {
  final List<HabitLogsEntity> logs;

  const HabitLogsSuccess({required this.logs});

  @override
  List<Object?> get props => [logs];
}

class HabitLogsError extends HabitLogsState {
  final String message;

  const HabitLogsError({required this.message});

  @override
  List<Object?> get props => [message];
}
