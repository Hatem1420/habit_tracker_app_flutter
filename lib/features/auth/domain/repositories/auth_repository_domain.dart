import 'package:multiple_result/multiple_result.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';

abstract class AuthRepositoryDomain {
  Future<Result<bool, Failure>> signUp(
    String name,
    String email,
    DateTime dateOfBirth,
    String password,
  );

  Future<Result<bool, Failure>> signIn(String email, String password);
}
