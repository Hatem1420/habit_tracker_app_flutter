import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_state.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/widgets/add_habit_bottom_sheet.dart';

class HabitsFeatureScreen extends HookWidget {
  const HabitsFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HabitsCubit>();
    // DateTime? pickedDate;
    // String formattedDate = "${pickedDate!.year}-${pickedDate.month}${pickedDate.day}";

    return Scaffold(
      appBar: AppBar(title: const Text('Habits Feature Screen')),
      body: SafeArea(
        child: BlocBuilder<HabitsCubit, HabitsState>(
          builder: (context, state) {
            switch (state) {
              case HabitsInitialState():
                cubit.getHabitsMethod();
                return const Center(child: CircularProgressIndicator());
              case HabitsSuccessState():
                if (state.habitsList.isEmpty) {
                  return Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [
                      const Center(child: Text(" No items yet ...")),
                      Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<HabitsCubit>(),
                                child: const AddHabitBottomSheet(),
                              );
                            },
                          );
                        },
                        label: const Text('Add'),
                      ),
                      Gap(20),
                    ],
                  );
                }
                // cubit.addNewHabit("habit 4");
                return Column(
                  children: [
                    Expanded(
                      child: Card(
                        margin: .symmetric(horizontal: 16, vertical: 8),
                        child: ListView.builder(
                          itemCount: state.habitsList.length,
                          itemBuilder: (context, index) {
                            final habit = state.habitsList[index];
                            final title = habit.title;
                            final createdAt = habit.createdAt; // Replace with actual createdAt value
                            // bool isComplete = false;

                            // Replace with actual completion status
                            return ListTile(
                              title: Text(title),
                              subtitle: Text('Created at: $createdAt'),
                              trailing: IconButton(
                                icon: Icon(Icons.more_vert),
                                onPressed: () {
                                  // context.push((Routes.));
                                },
                              ), //Icons.density_small
                            );
                          },
                        ),
                      ),
                    ),

                    ElevatedButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<HabitsCubit>(),
                                child: const AddHabitBottomSheet(),
                              );
                            },
                          );
                        },
                        label: const Text('Add'),
                      ),
                  ],
                );

              case HabitsErrorState():
                return const Center(child: Text('Error loading habits'));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
