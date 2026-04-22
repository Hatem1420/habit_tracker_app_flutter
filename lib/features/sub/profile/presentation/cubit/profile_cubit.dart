import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/domain/use_cases/profile_use_case.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase _profileUseCase;

  ProfileCubit(this._profileUseCase) : super(ProfileInitialState());

  Future<void> getProfileMethod() async {
    emit(ProfileLoadingState());
    final result = await _profileUseCase.getProfile();
    result.when(
      (success) {
        emit(ProfileSuccessState(profile: success));
      },
      (whenError) {
        emit(ProfileErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
