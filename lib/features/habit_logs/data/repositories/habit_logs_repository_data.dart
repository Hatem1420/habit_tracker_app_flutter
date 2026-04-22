import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:personal_habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/data/models/habit_logs_model.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/domain/entities/habit_logs_entity.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/data/datasources/habit_logs_remote_data_source.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/domain/repositories/habit_logs_repository_domain.dart';

@LazySingleton(as: HabitLogsRepositoryDomain)
class HabitLogsRepositoryData implements HabitLogsRepositoryDomain {
  final BaseHabitLogsRemoteDataSource remoteDataSource;

  HabitLogsRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<HabitLogsEntity>, Failure>> getHabitLogs() async {
    try {
      final response = await remoteDataSource.getHabitLogs();

      return Success(response.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> addHabitLog({required String habitId}) async {
    try {
      await remoteDataSource.addHabitLog(habitId: habitId);
      return const Success(unit);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
