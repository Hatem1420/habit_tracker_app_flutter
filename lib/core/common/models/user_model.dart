import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_habit_tracker_app/core/common/entities/user_entity.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory UserModel({
    required String id,
    required String name,
    required String email,
    required DateTime dateOfBirth,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

extension UserModelMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      dateOfBirth: dateOfBirth,
    );
  }
}
