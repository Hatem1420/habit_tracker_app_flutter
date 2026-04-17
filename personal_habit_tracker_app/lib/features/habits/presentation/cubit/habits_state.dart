import 'package:equatable/equatable.dart';
import 'package:personal_habit_tracker_app/features/habits/domain/entities/habits_entity.dart';

abstract class HabitsState extends Equatable {
  const HabitsState();

  @override
  List<Object?> get props => [];
}

class HabitsInitialState extends HabitsState {}
class HabitsSuccessState extends HabitsState {
  final List <HabitsEntity> habitsList;
  const HabitsSuccessState({this.habitsList = const []});
  @override
  List<Object?> get props => [habitsList];
}

class HabitsErrorState extends HabitsState {
  final String message;
  const HabitsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

