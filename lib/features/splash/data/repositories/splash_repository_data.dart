import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:personal_habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';

import 'package:personal_habit_tracker_app/features/splash/data/datasources/splash_remote_data_source.dart';
import 'package:personal_habit_tracker_app/features/splash/domain/repositories/splash_repository_domain.dart';

@LazySingleton(as: SplashRepositoryDomain)
class SplashRepositoryData implements SplashRepositoryDomain {
  final BaseSplashRemoteDataSource remoteDataSource;

  SplashRepositoryData(this.remoteDataSource);

  @override
  Future<Result<bool, Failure>> getSplash() async {
    try {
      final response = await remoteDataSource.getUser();
      if (!response) {
        throw Exception('No user found');
      }
      return Success(response);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
