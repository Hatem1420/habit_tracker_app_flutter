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
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<HabitLogsCubit, HabitLogsState>(
          listener: (context, state) {
            switch (state) {
              case HabitLogsLoading():
                context.showLoading();
                break;
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
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 18),
                    itemBuilder: (context, index) {
                      final habit = state.logs[index];

                      final HabitLogItemEntity? latestLog =
                          habit.habitLogs.isEmpty ? null : habit.habitLogs.last;

                      return HabitLogCard(
                        title: habit.title,
                        date: (latestLog?.logDate ??
                                habit.createdAt ??
                                'No date')
                            .toString()
                            .split('T')
                            .first,
                        isCompleted: latestLog?.isCompleted ?? false,
                        onChanged: (value) async {
                          if (value != true) return;

                          final confirmed = await showDialog<bool>(
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
                                          borderRadius:
                                              BorderRadius.circular(22),
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
                                                    dialogContext, false);
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xff7261F6),
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
                                                    dialogContext, true);
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

                          if (confirmed == true) {
                            await context
                                .read<HabitLogsCubit>()
                                .addHabitLog(habit.id);
                          }
                        },
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