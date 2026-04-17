import 'package:equatable/equatable.dart';

class HabitLogItemEntity extends Equatable {
  final int id;
  final String habitId;
  final String logDate;
  final bool isCompleted;

  const HabitLogItemEntity({
    required this.id,
    required this.habitId,
    required this.logDate,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [id, habitId, logDate, isCompleted];
}