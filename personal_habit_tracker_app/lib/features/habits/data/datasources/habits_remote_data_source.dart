import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/services/local_keys_service.dart';
import 'package:personal_habit_tracker_app/core/services/user_service.dart';
import 'package:personal_habit_tracker_app/features/habits/data/models/habits_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseHabitsRemoteDataSource {
  Future<List<HabitsModel>> getHabits();
  Future<void> addHabit(String title);
}

@LazySingleton(as: BaseHabitsRemoteDataSource)
class HabitsRemoteDataSource implements BaseHabitsRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  final UserService userService;
  

  HabitsRemoteDataSource(this.userService, this._supabase, this._localKeysService);

  @override
  Future<List<HabitsModel>> getHabits() async {
  // final userId = _supabase.auth.currentUser?.id;
  // final userId = userService.user?.id;
  final userId = userService.user?.id;
  try{
    final response = await _supabase.from('habits').select('*').eq('user_id',userId!);   //293c1e23-8b30-468b-8b71-e8c2e4de01d6
    return (response as List).map((e) => HabitsModel.fromJson(e)).toList();
  }
   catch (e) {
    print("Error fetching habits: ${e.toString()}");
    return [];
  }
    // try {
    //   return HabitsModel(id: 1, firstName: "Last Name", lastName: "First Name");
    // } catch (error) {
    //  throw FailureExceptions.getException(error);
    // }
  }


@override
Future<void> addHabit(String title) async {
  final userId = userService.user?.id;
  await _supabase.from('habits').insert({
    'title': title,
    'user_id': userId, // 293c1e23-8b30-468b-8b71-e8c2e4de01d6      //'293c1e23-8b30-468b-8b71-e8c2e4de01d6'
  });
}


}
