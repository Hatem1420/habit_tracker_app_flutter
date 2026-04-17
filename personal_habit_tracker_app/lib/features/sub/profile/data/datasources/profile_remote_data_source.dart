import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/common/entities/user_entity.dart';
import 'package:personal_habit_tracker_app/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/data/models/profile_model.dart';
import 'package:personal_habit_tracker_app/core/errors/network_exceptions.dart';

abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

@LazySingleton(as: BaseProfileRemoteDataSource)
class ProfileRemoteDataSource implements BaseProfileRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  ProfileRemoteDataSource(this._userService, this._supabase);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final UserEntity userInfo = _userService.user!;
      return ProfileModel(
        id: userInfo.id,
        name: userInfo.name,
        email: userInfo.email,
        dateOfBirth: userInfo.dateOfBirth,
      );
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
