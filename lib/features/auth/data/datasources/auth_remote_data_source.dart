import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseAuthRemoteDataSource {
  Future<bool> signUp(
    String name,
    String email,
    DateTime dateOfBirth,
    String password,
  );

  Future<bool> signIn(String email, String password);
}

@LazySingleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  AuthRemoteDataSource(this._supabase, this._userService);

  @override
  Future<bool> signUp(
    String name,
    String email,
    DateTime dateOfBirth,
    String password,
  ) async {
    final userAuth = await _supabase.auth.signUp(
      password: password,
      email: email,
      data: {'name': name, 'date_of_birth': dateOfBirth.toIso8601String()},
    );
    await _userService.registerUser(userAuth.user!.id);
    return true;
  }

  @override
  Future<bool> signIn(String email, String password) async {
    final userAuth = await _supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );
    await _userService.registerUser(userAuth.user!.id);
    return true;
  }
}
