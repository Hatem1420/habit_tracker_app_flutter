import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:personal_habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';

import 'package:personal_habit_tracker_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:personal_habit_tracker_app/features/auth/domain/repositories/auth_repository_domain.dart';

@LazySingleton(as: AuthRepositoryDomain)
class AuthRepositoryData implements AuthRepositoryDomain {
  final BaseAuthRemoteDataSource remoteDataSource;

  AuthRepositoryData(this.remoteDataSource);

  @override
  Future<Result<bool, Failure>> signUp(
    String name,
    String email,
    DateTime dateOfBirth,
    String password,
  ) async {
    try {
      final response = await remoteDataSource.signUp(
        name,
        email,
        dateOfBirth,
        password,
      );
      return Success(response);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<bool, Failure>> signIn(String email, String password) async {
    try {
      final response = await remoteDataSource.signIn(email, password);
      return Success(response);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
