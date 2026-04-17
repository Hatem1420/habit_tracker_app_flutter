import 'package:multiple_result/multiple_result.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';

abstract class SplashRepositoryDomain {
    Future<Result<bool, Failure>> getSplash();
}
