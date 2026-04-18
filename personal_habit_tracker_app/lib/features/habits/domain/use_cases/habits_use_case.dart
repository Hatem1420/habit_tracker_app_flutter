import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';
import 'package:personal_habit_tracker_app/features/habits/domain/entities/habits_entity.dart';
import 'package:personal_habit_tracker_app/features/habits/domain/repositories/habits_repository_domain.dart';


@lazySingleton
class HabitsUseCase {
  final HabitsRepositoryDomain _repositoryData;

  HabitsUseCase(this._repositoryData);

   Future<Result<List<HabitsEntity>, Failure>> getHabits() async {
    return _repositoryData.getHabits();
  }
  Future<void> addHabit(String title) async {
    await _repositoryData.addHabit(title);
  }

   Future<void> deleteHabit(String id) async {
    await _repositoryData.deleteHabit(id);
}
}
