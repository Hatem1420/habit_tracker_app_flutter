import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';
import 'package:personal_habit_tracker_app/features/splash/domain/repositories/splash_repository_domain.dart';


@lazySingleton
class SplashUseCase {
  final SplashRepositoryDomain _repositoryData;

  SplashUseCase(this._repositoryData);

   Future<Result<bool, Failure>> getUser() async {
    return _repositoryData.getSplash();
  }
}
