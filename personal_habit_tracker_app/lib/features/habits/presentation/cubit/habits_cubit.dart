import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_habit_tracker_app/features/habits/domain/use_cases/habits_use_case.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_state.dart';

class HabitsCubit extends Cubit<HabitsState> {
  final HabitsUseCase _habitsUseCase;

  HabitsCubit(this._habitsUseCase) : super(HabitsInitialState());

  Future<void> getHabitsMethod() async {
    final result = await _habitsUseCase.getHabits();
    result.when(
      (success) {
        emit(HabitsSuccessState(habitsList: success));
      },
      (whenError) {
        print (whenError.message);
       emit(HabitsErrorState(message: whenError.message));
      },
    );
  }

  Future<void> addNewHabit(String title) async {
  await _habitsUseCase.addHabit(title); 
  getHabitsMethod(); 
}


  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
