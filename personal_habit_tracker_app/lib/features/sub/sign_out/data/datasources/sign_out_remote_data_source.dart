import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/services/user_service.dart';

abstract class BaseSignOutRemoteDataSource {
  Future<void> getSignOut();
}

@LazySingleton(as: BaseSignOutRemoteDataSource)
class SignOutRemoteDataSource implements BaseSignOutRemoteDataSource {
  final UserService _userService;

  SignOutRemoteDataSource(this._userService);

  @override
  Future<void> getSignOut() async {
    await _userService.signOut();
  }
}
