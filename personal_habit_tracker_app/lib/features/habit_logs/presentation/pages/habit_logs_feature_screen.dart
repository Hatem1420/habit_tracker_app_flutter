import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_cubit.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/widgets/habit_logs_view.dart';

class HabitLogsFeatureScreen extends StatelessWidget {
  final String habitId;

  const HabitLogsFeatureScreen({
    super.key,
    required this.habitId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<HabitLogsCubit>()..getHabitLogsMethod(),
      child: HabitLogsView(habitId: habitId),
    );
  }
}
