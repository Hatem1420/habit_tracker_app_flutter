import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:personal_habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';
import 'package:personal_habit_tracker_app/features/habits/data/datasources/habits_remote_data_source.dart';
import 'package:personal_habit_tracker_app/features/habits/data/models/habits_model.dart';
import 'package:personal_habit_tracker_app/features/habits/domain/entities/habits_entity.dart';
import 'package:personal_habit_tracker_app/features/habits/domain/repositories/habits_repository_domain.dart';

@LazySingleton(as: HabitsRepositoryDomain)
class HabitsRepositoryData implements HabitsRepositoryDomain {
  final BaseHabitsRemoteDataSource remoteDataSource;

  HabitsRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<HabitsEntity>, Failure>> getHabits() async {
    try {
      final response = await remoteDataSource.getHabits();
      return Success(response.map((e) => e.toEntity()).toList());
    } on Failure catch (_) {
      rethrow;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> addHabit(String title) async {
    try {
      await remoteDataSource.addHabit(title);
    } on Failure catch (_) {
      rethrow;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> deleteHabit(String id) async {
    try {
      await remoteDataSource.deleteHabit(id);
    } on Failure catch (_) {
      rethrow;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
