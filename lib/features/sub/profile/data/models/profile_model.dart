import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/domain/entities/profile_entity.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory ProfileModel({
    required String id,
    required String name,
    required String email,
    required DateTime dateOfBirth,
    required int totalHabits,
    required int noOfCompletes
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> json) =>
      _$ProfileModelFromJson(json);
}

extension ProfileModelMapper on ProfileModel {
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      name: name,
      email: email,
      dateOfBirth: dateOfBirth,
      noOfCompletes: noOfCompletes,
      totalHabits: totalHabits,
    );
  }
}
