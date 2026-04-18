import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_cubit.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_state.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/widgets/complete_habit.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/widgets/habitlog_section.dart';

class HabitLogsView extends StatelessWidget {
  final String habitId;

  const HabitLogsView({
    super.key,
    required this.habitId,
  });

  DateTime _parseOnlyDate(String value) {
    final datePart = value.split('T').first;
    return DateTime.parse(datePart);
  }

  Future<void> _completeHabit(
    BuildContext context, {
    required String habitId,
  }) async {
    final confirm = await showCompleteHabitDialog(context);

    if (confirm == true) {
      await context.read<HabitLogsCubit>().addHabitLog(habitId);
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<HabitLogsCubit, HabitLogsState>(
        builder: (context, state) {
          if (state is HabitLogsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }

            final habit = matchedHabits.first;

            final now = DateTime.now();
            final today = DateTime(now.year, now.month, now.day);

            final todayLogs = habit.habitLogs.where((log) {
              final logDate = _parseOnlyDate(log.logDate.toString());
              return logDate == today;
            }).toList();

            final previousLogs = habit.habitLogs.where((log) {
              final logDate = _parseOnlyDate(log.logDate.toString());
              return logDate.isBefore(today);
            }).toList()
              ..sort((a, b) => b.logDate.compareTo(a.logDate));

            final todayDateText =
                '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';

            return RefreshIndicator(
              onRefresh: () async {
                await context.read<HabitLogsCubit>().getHabitLogsMethod();
              },
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  HabitLogsSection(
                    title: 'Today',
                    habit: habit,
                    logs: todayLogs,
                    allowTap: todayLogs.isEmpty,
                    fallbackDate: todayDateText,
                    onCompleteHabit: () async {
                      await _completeHabit(context, habitId: habit.id);
                    },
                  ),
                  const SizedBox(height: 24),
                  HabitLogsSection(
                    title: 'Previous',
                    habit: habit,
                    logs: previousLogs,
                    allowTap: false,
                    fallbackDate: habit.createdAt.toString().split('T').first,
                    onCompleteHabit: null,
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}