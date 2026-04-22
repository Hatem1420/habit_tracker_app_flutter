import 'package:multiple_result/multiple_result.dart';
import 'package:personal_habit_tracker_app/core/errors/failure.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepositoryDomain {
    Future<Result<ProfileEntity, Failure>> getProfile();
}
