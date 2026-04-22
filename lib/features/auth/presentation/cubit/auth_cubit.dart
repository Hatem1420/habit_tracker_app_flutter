import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_habit_tracker_app/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:personal_habit_tracker_app/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;

  AuthCubit(this._authUseCase) : super(AuthInitialState());

  Future<void> signUp({
    required String name,
    required String email,
    required DateTime dateOfBirth,
    required String password,
  }) async {
    emit(AuthLoadingState());
    final result = await _authUseCase.signUp(
      name,
      email,
      dateOfBirth,
      password,
    );
    result.when(
      (success) {
        emit(AuthSuccessState());
      },
      (whenError) {
        emit(AuthErrorState(message: whenError.message));
      },
    );
  }

  Future<void> signIn(String email, String password) async {
    emit(AuthLoadingState());
    final result = await _authUseCase.signIn(email, password);
    result.when(
      (success) {
        emit(AuthSuccessState());
      },
      (whenError) {
        emit(AuthErrorState(message: whenError.message));
      },
    );
  }

  void toggleSign(bool signIn) {
    emit(AuthInitialState(signIn: signIn));
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
