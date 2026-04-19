import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_habit_tracker_app/core/widgets/loading_widget.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_cubit.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_state.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/widgets/habit_logs_widget.dart';

class HabitLogsFeatureScreen extends StatelessWidget {
  final String habitId;

  const HabitLogsFeatureScreen({super.key, required this.habitId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<HabitLogsCubit>()..getHabitLogsMethod(),
      child: _HabitLogsView(habitId: habitId),
    );
  }
}

class _HabitLogsView extends StatelessWidget {
  final String habitId;

  const _HabitLogsView({required this.habitId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Habit Logs'),
      ),
      body: BlocBuilder<HabitLogsCubit, HabitLogsState>(
        builder: (context, state) {
          if (state is HabitLogsLoading) {
            return const LoadingWidget();
          }

          if (state is HabitLogsError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }

          if (state is HabitLogsSuccess) {
            final matchedHabits = state.logs
                .where((e) => e.id.toString() == habitId)
                .toList();

            if (matchedHabits.isEmpty) {
              return const Center(
                child: Text(
                  'Selected habit not found',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              );
            }

            final habit = matchedHabits.first;
            final logs = [...habit.habitLogs]
              ..sort((a, b) => b.logDate.compareTo(a.logDate));

            if (logs.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    HabitLogCard(
                      title: habit.title,
                      date: habit.createdAt.toString().split('T').first,
                      isCompleted: false,
                      onChanged: (value) async {
                        if (value != true) return;

                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(22),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE8E0F8),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: const Icon(
                                        Icons.check_circle_outline_rounded,
                                        color: Color(0xff7261F6),
                                        size: 34,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Complete Habit?',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Are you sure you want to mark this habit as completed?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff8D8896),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              side: const BorderSide(
                                                color: Color(0xffEAE6F5),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 14,
                                                  ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(
                                                dialogContext,
                                                false,
                                              );
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(
                                                0xff7261F6,
                                              ),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 14,
                                                  ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(
                                                dialogContext,
                                                true,
                                              );
                                            },
                                            child: const Text('Yes'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );

                        if (confirm == true) {
                          await context.read<HabitLogsCubit>().addHabitLog(
                            habit.id,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                await context.read<HabitLogsCubit>().getHabitLogsMethod();
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: logs.length,
                separatorBuilder: (_, _) => const SizedBox(height: 18),
                itemBuilder: (context, index) {
                  final log = logs[index];

                  return HabitLogCard(
                    title: habit.title,
                    date: log.logDate.toString().split('T').first,
                    isCompleted: log.isCompleted,
                    onChanged: (value) async {
                      if (value != true) return;
                    },
                  );
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
