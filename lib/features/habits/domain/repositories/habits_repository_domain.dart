import 'package:multiple_result/multiple_result.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';
import 'package:personal_habit_tracker_app/features/habits/domain/entities/habits_entity.dart';

abstract class HabitsRepositoryDomain {
    Future<Result<List<HabitsEntity>, Failure>> getHabits();
    Future<void> addHabit(String title);
    Future<void> deleteHabit(String id);
}
