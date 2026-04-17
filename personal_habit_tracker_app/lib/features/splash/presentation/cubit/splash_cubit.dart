import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_habit_tracker_app/features/splash/domain/use_cases/splash_use_case.dart';
import 'package:personal_habit_tracker_app/features/splash/presentation/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashUseCase _splashUseCase;

  SplashCubit(this._splashUseCase) : super(SplashInitialState()) {
    getUser();
  }

  Future<void> getUser() async {
    final result = await _splashUseCase.getUser();
    result.when(
      (success) {
        emit(SplashSuccessState());
      },
      (whenError) {
        emit(SplashErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
