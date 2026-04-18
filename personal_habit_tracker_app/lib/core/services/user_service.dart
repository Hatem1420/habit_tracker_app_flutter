import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/common/entities/user_entity.dart';
import 'package:personal_habit_tracker_app/core/common/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class UserService {
  final SupabaseClient _supabase;

  UserEntity? _userEntity;

  UserService(this._supabase);

  UserEntity? get user => _userEntity;

  set setUser(UserEntity newUser) => _userEntity = newUser;

  Future<void> registerUser(String authId) async {
    final userInfo = await _supabase
        .from('users')
        .select()
        .eq('auth_id', authId)
        .single();

    _userEntity = UserModel.fromJson(userInfo).toEntity();
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
    _userEntity = null;
  }

}
