import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_habit_tracker_app/core/widgets/loading_widget.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_cubit.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_state.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/widgets/habitlog_section.dart';

class HabitLogsFeatureScreen extends StatelessWidget {
  final String habitId;

  const HabitLogsFeatureScreen({super.key, required this.habitId});

  // --- Date Helper ---
  DateTime _parseOnlyDate(String value) {
    try {
      final datePart = value.split('T').first;
      return DateTime.parse(datePart);
    } catch (e) {
      return DateTime.now();
    }
  }
  // --- PERCENTAGE LOGIC: Counts from the FIRST LOG to get 100% ---
  double _calculatePercentage(dynamic habit) {
    if (habit.habitLogs.isEmpty) return 0.0;
    
    // 1. Find the first day you actually logged this habit
    final firstLogDate = habit.habitLogs
        .map((log) => _parseOnlyDate(log.logDate.toString()))
        .reduce((a, b) => a.isBefore(b) ? a : b);

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    // 2. Days elapsed since you started your streak
    final daysSinceStart = today.difference(firstLogDate).inDays + 1;
    final completedCount = habit.habitLogs.length;

    // 3. Ratio (2 logs in 2 days = 100%)
    double progress = completedCount / daysSinceStart;
    return progress.clamp(0.0, 1.0);
  }

  
 Future<bool?> _showConfirmDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text('Complete Habit?'),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => context.pop(true),
          child: Text(
            'Yes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => context.pop(context),
        ),
        title: const Text(
          'Habit Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<HabitLogsCubit, HabitLogsState>(
        builder: (context, state) {
          if (state is HabitLogsLoading) return const LoadingWidget();
          if (state is HabitLogsError) return Center(child: Text(state.message));

          if (state is HabitLogsSuccess) {
            final habit = state.logs.firstWhere((e) => e.id.toString() == habitId);
            
            // Percentage calculations
            final double progressValue = _calculatePercentage(habit);
            final int displayPercent = (progressValue * 100).toInt();

            final now = DateTime.now();
            final today = DateTime(now.year, now.month, now.day);
            
            // Filter only EXISTING logs for history
            final todayLogs = habit.habitLogs.where((log) => _parseOnlyDate(log.logDate.toString()) == today).toList();
            final previousLogs = habit.habitLogs.where((log) => _parseOnlyDate(log.logDate.toString()).isBefore(today)).toList()
              ..sort((a, b) => b.logDate.compareTo(a.logDate));

            return Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    ),
                    child: RefreshIndicator(
                      onRefresh: () async => await context.read<HabitLogsCubit>().getHabitLogsMethod(),
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                         
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 160, width: 160,
                                  child: CircularProgressIndicator(
                                    value: progressValue,
                                    strokeWidth: 12,
                                    backgroundColor: Colors.grey.shade100,
                                    valueColor:  AlwaysStoppedAnimation(Theme.of(context).colorScheme.primary,),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text('$displayPercent%', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                                    const Text('Quality', style: TextStyle(color: Colors.grey)),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 30),

                            // Today Section
                            HabitLogsSection(
                              title: 'Today',
                              habit: habit,
                              logs: todayLogs,
                              allowTap: todayLogs.isEmpty,
                              fallbackDate: "Today",
                              onCompleteHabit: () async {
                                final confirm = await _showConfirmDialog(context);
                                if (confirm == true) {
                                  context.read<HabitLogsCubit>().addHabitLog(habitId);
                                }
                              },
                            ),
                            const SizedBox(height: 30),

                            // History Section (Strictly completed logs only)
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Completed History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(height: 15),
                            
                            if (previousLogs.isEmpty)
                              const Text("No past logs yet.", style: TextStyle(color: Colors.grey))
                            else
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: previousLogs.length,
                                itemBuilder: (context, index) {
                                  final log = previousLogs[index];
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.green.withValues(alpha: .08),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.check_circle, color: Colors.green),
                                        const SizedBox(width: 15),
                                        Text(
                                          'Done on ${log.logDate.toString().split(' ').first}',
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}