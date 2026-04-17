import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';
import 'package:personal_habit_tracker_app/features/auth/domain/repositories/auth_repository_domain.dart';

@lazySingleton
class AuthUseCase {
  final AuthRepositoryDomain _repositoryData;

  AuthUseCase(this._repositoryData);

  Future<Result<bool, Failure>> signUp(
    String name,
    String email,
    DateTime dateOfBirth,
    String password,
  ) async => _repositoryData.signUp(name, email, dateOfBirth, password);

  Future<Result<bool, Failure>> signIn(String email, String password) async =>
      _repositoryData.signIn(email, password);
}
