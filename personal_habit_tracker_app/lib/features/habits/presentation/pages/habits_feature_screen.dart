import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_habit_tracker_app/core/navigation/routers.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_state.dart';

class HabitsFeatureScreen extends StatelessWidget {
  const HabitsFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HabitsCubit>();
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits Feature Screen'),
        actions: [
          IconButton(
            onPressed: () => context.push(Routes.habitLogs),
            icon: Icon(Icons.receipt),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: OutlineInputBorder(),
              backgroundColor: Colors.white,
              content: Column(
                crossAxisAlignment: .center,
                children: [
                  SizedBox(height: 32),
                  TextField(controller: controller),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      cubit.addNewHabit(controller.text);
                    },
                    child: Text('Save'),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<HabitsCubit, HabitsState>(
        builder: (context, state) {
          switch (state) {
            case HabitsInitialState():
              // cubit.getHabitsMethod();
              return const Center(child: CircularProgressIndicator());
            case HabitsSuccessState():
              if (state.habitsList.isEmpty) {
                return const Center(child: Text(" DB is empty "));
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
                          final createdAt = habit
                              .createdAt; // Replace with actual createdAt value
                          // bool isComplete = false;

                          // Replace with actual completion status
                          return ListTile(
                            title: Text(title),
                            subtitle: Text('Created at: $createdAt'),
                            trailing: Icon(Icons.star),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  /* ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          shape: OutlineInputBorder(),
                          backgroundColor: Colors.white,
                          content: Column(
                            crossAxisAlignment: .center,
                            children: [
                              SizedBox(height: 32),
                              TextField(controller: controller),
                              SizedBox(height: 32),
                              ElevatedButton(
                                onPressed: () {
                                  cubit.addNewHabit(controller.text);
                                },
                                child: Text('Save'),
                              ),
                              SizedBox(height: 32),
                            ],
                          ),
                        ),
                      );
                    },
                    label: Text('add'),
                  ), */
                  SizedBox(height: 16),
                ],
              );

            case HabitsErrorState():
              return const Center(child: Text('Error loading habits'));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
