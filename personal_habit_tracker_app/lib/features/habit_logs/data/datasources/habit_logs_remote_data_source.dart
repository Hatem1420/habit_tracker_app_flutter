import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:personal_habit_tracker_app/core/services/user_service.dart';

import 'package:personal_habit_tracker_app/features/habit_logs/data/models/habit_logs_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseHabitLogsRemoteDataSource {
  Future<List<HabitLogsModel>> getHabitLogs();

  Future<void> addHabitLog({required String habitId});
}

@LazySingleton(as: BaseHabitLogsRemoteDataSource)
class HabitLogsRemoteDataSource implements BaseHabitLogsRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  HabitLogsRemoteDataSource(this._supabase, this._userService);

  @override
  Future<List<HabitLogsModel>> getHabitLogs() async {
    try {
      final userId = _supabase.auth.currentUser!.id;
      final response = await _supabase
          .from('habits')
          .select(
            'id, title, created_at, habit_logs(id, habit_id, log_date, is_completed)',
          )
         ;

      return response
          .map<HabitLogsModel>((item) => HabitLogsModel.fromJson(item))
          .toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> addHabitLog({required String habitId}) async {
    try {
      final now = DateTime.now();

      await _supabase.from('habit_logs').insert({
        'habit_id': habitId,
        'log_date':
            '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}',
        'is_completed': true,
      });
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
