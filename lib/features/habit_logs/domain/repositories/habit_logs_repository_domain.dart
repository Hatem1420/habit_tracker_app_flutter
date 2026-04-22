import 'package:multiple_result/multiple_result.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/domain/entities/habit_logs_entity.dart';

abstract class HabitLogsRepositoryDomain {
  Future<Result<List<HabitLogsEntity>, Failure>> getHabitLogs();

  Future<Result<void, Failure>> addHabitLog({
    required String habitId,
  });
}