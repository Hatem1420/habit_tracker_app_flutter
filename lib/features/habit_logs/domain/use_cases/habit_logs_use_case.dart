import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/domain/entities/habit_logs_entity.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/domain/repositories/habit_logs_repository_domain.dart';

@lazySingleton
class HabitLogsUseCase {
  final HabitLogsRepositoryDomain _repositoryData;

  HabitLogsUseCase(this._repositoryData);

  Future<Result<List<HabitLogsEntity>, Failure>> getHabitLogs() async {
    return _repositoryData.getHabitLogs();
  }

  Future<Result<void, Failure>> addHabitLog({
    required String habitId,
  }) async {
    return _repositoryData.addHabitLog(habitId: habitId);
  }
}