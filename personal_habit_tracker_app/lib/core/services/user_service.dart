import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/common/entities/user_entity.dart';

@lazySingleton
class UserService {
  UserEntity? _userEntity;

  UserEntity? get user => _userEntity;

  set setUser(UserEntity newUser) => _userEntity = newUser;

  void signOut() => _userEntity = null;
}
