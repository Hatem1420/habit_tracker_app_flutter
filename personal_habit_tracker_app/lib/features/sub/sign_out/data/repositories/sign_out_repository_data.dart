import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:personal_habit_tracker_app/core/errors/network_exceptions.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';

import 'package:personal_habit_tracker_app/features/sub/sign_out/data/datasources/sign_out_remote_data_source.dart';
import 'package:personal_habit_tracker_app/features/sub/sign_out/domain/repositories/sign_out_repository_domain.dart';

@LazySingleton(as: SignOutRepositoryDomain)
class SignOutRepositoryData implements SignOutRepositoryDomain {
  final BaseSignOutRemoteDataSource remoteDataSource;

  SignOutRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> getSignOut() async {
    try {
      await remoteDataSource.getSignOut();
      return Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
