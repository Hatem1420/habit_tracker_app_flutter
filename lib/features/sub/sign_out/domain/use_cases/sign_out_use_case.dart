import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';
import 'package:personal_habit_tracker_app/features/sub/sign_out/domain/repositories/sign_out_repository_domain.dart';


@lazySingleton
class SignOutUseCase {
  final SignOutRepositoryDomain _repositoryData;

  SignOutUseCase(this._repositoryData);

   Future<Result<void, Failure>> getSignOut() async {
    return _repositoryData.getSignOut();
  }
}
