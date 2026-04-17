import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:personal_habit_tracker_app/core/services/local_keys_service.dart';

import 'package:personal_habit_tracker_app/features/habit_logs/data/models/habit_logs_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseHabitLogsRemoteDataSource {
  Future<List<HabitLogsModel>> getHabitLogs();
}

@LazySingleton(as: BaseHabitLogsRemoteDataSource)
class HabitLogsRemoteDataSource implements BaseHabitLogsRemoteDataSource {
  final SupabaseClient _supabase;

  HabitLogsRemoteDataSource(this._supabase);

  @override
  Future<List<HabitLogsModel>> getHabitLogs() async {
    try {
      final response = await _supabase
          .from('habits')
          .select(
            'id, title, created_at, habit_logs(id, habit_id, log_date, is_completed)',
          );

      return response
          .map<HabitLogsModel>((item) => HabitLogsModel.fromJson(item))
          .toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
