
import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSplashRemoteDataSource {
  Future<bool> getUser();
}

@LazySingleton(as: BaseSplashRemoteDataSource)
class SplashRemoteDataSource implements BaseSplashRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  SplashRemoteDataSource(this._supabase, this._userService);

  @override
  Future<bool> getUser() async {
    final userSession = _supabase.auth.currentSession;

    final isLogged = userSession?.accessToken != null;
    final sessionExpired = userSession?.isExpired ?? true;

    if (!isLogged || sessionExpired) {
      return false;
    }
    await _userService.registerUser(_supabase.auth.currentUser!.id);
    return true;
  }
}
