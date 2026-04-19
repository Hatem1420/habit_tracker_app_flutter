import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/services/user_service.dart';
import 'package:personal_habit_tracker_app/features/habits/data/models/habits_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseHabitsRemoteDataSource {
  Future<List<HabitsModel>> getHabits();
  Future<void> addHabit(String title);
  Future<void> deleteHabit(String id);
}

@LazySingleton(as: BaseHabitsRemoteDataSource)
class HabitsRemoteDataSource implements BaseHabitsRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService userService;

  HabitsRemoteDataSource(this.userService, this._supabase);

  @override
  Future<List<HabitsModel>> getHabits() async {
    final userId = userService.user?.id;
    try {
      final response = await _supabase
          .from('habits')
          .select('*')
          .eq('user_id', userId!);
      return (response as List).map((e) => HabitsModel.fromJson(e)).toList();
    } catch (e) {
      log("Error fetching habits: ${e.toString()}");
      return [];
    }
  }

  @override
  Future<void> addHabit(String title) async {
    final userId = userService.user?.id;
    await _supabase.from('habits').insert({'title': title, 'user_id': userId});
  }

  @override
  Future<void> deleteHabit(String id) async {
    final userId = userService.user?.id;
    await _supabase
        .from('habits')
        .delete()
        .eq('id', id)
        .eq('user_id', userId.toString());
  }
}
