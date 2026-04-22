import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/domain/use_cases/habit_logs_use_case.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_state.dart';

@injectable
class HabitLogsCubit extends Cubit<HabitLogsState> {
  final HabitLogsUseCase _habitLogsUseCase;

  HabitLogsCubit(this._habitLogsUseCase) : super(HabitLogsInitial());

  Future<void> getHabitLogsMethod() async {
    emit(HabitLogsLoading());
    final result = await _habitLogsUseCase.getHabitLogs();

    result.when(
      (success) {
        emit(HabitLogsSuccess(logs: success));
      },
      (whenError) {
        emit(HabitLogsError(message: whenError.message));
      },
    );
  }

  Future<void> addHabitLog(String habitId) async {
    final result = await _habitLogsUseCase.addHabitLog(habitId: habitId);

    result.when(
      (_) async {
        await getHabitLogsMethod();
      },
      (whenError) {
        emit(HabitLogsError(message: whenError.message));
      },
    );
  }
}
