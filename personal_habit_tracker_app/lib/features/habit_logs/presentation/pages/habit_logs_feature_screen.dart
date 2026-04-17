import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_habit_tracker_app/core/extensions/context_extensions.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/domain/entities/habit_log_item_entity.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_cubit.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_state.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/widgets/habit_logs_widget.dart';

class HabitLogsFeatureScreen extends HookWidget {
  const HabitLogsFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HabitLogsCubit>();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        cubit.getHabitLogsMethod();
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: const Color(0xffF7F5FB),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xffF7F5FB),
        title: const Text(
          'Habit Logs',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<HabitLogsCubit, HabitLogsState>(
          listener: (context, state) {
            switch (state) {
            
              case HabitLogsSuccess():
                context.hideLoading();
                break;
              case HabitLogsError():
                context.hideLoading();
                context.showSnackBar(state.message, isError: true);
                break;
              default:
                context.hideLoading();
            }
          },
          child: BlocBuilder<HabitLogsCubit, HabitLogsState>(
            builder: (context, state) {
              if (state is HabitLogsSuccess) {
                if (state.logs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No habit logs yet',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    await cubit.getHabitLogsMethod();
                  },
                  child: ListView.separated(
                    itemCount: state.logs.length,
                    separatorBuilder: (context, index) => SizedBox(height: 18),
                    itemBuilder: (context, index) {
                      final habit = state.logs[index];

                      final HabitLogItemEntity? latestLog =
                          habit.habitLogs.isEmpty ? null : habit.habitLogs.last;

                      return HabitLogCard(
                        title: habit.title,
                        date: (latestLog?.logDate ?? habit.createdAt)
                            .split('T')
                            .first,
                        isCompleted: latestLog?.isCompleted ?? false,
                      );
                    },
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
