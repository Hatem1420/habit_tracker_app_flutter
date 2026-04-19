import 'dart:core';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_habit_tracker_app/features/habits/domain/use_cases/habits_use_case.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_state.dart';

class HabitsCubit extends Cubit<HabitsState> {
  final HabitsUseCase _habitsUseCase;

  HabitsCubit(this._habitsUseCase) : super(HabitsInitialState());

  Future<void> getHabitsMethod() async {
    emit(HabitsInitialState());
    final result = await _habitsUseCase.getHabits();
    result.when(
      (success) {
        emit(HabitsSuccessState(habitsList: success));
      },
      (whenError) {
        emit(HabitsErrorState(message: whenError.message));
      },
    );
  }

  Future<void> addNewHabit(String title) async {
    emit(HabitsInitialState());
    await _habitsUseCase.addHabit(title);
    getHabitsMethod();
  }

  Future<void> deleteHabit(String id) async {
    emit(HabitsInitialState());
    try {
      await _habitsUseCase.deleteHabit(id);

      await getHabitsMethod();
    } catch (e) {
      emit(HabitsErrorState(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
