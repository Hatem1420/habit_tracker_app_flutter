import 'package:flutter/material.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/widgets/habit_logs_widget.dart';

class HabitLogsSection extends StatelessWidget {
  final String title;
  final dynamic habit;
  final List logs;
  final bool allowTap;
  final String fallbackDate;
  final Future<void> Function()? onCompleteHabit;

  const HabitLogsSection({
    super.key,
    required this.title,
    required this.habit,
    required this.logs,
    required this.allowTap,
    required this.fallbackDate,
    required this.onCompleteHabit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        if (logs.isEmpty)
          HabitLogCard(
            title: habit.title,
            date: fallbackDate,
            isCompleted: false,
            onChanged: allowTap
                ? (value) async {
                    if (value != true) return;
                    await onCompleteHabit?.call();
                  }
                : null,
          )
        else
          ...logs.map(
            (log) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: HabitLogCard(
                title: habit.title,
                date: log.logDate.toString().split('T').first,
                isCompleted: log.isCompleted,
                onChanged: null,
              ),
            ),
          ),
      ],
    );
  }
}