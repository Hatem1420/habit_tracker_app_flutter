import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:personal_habit_tracker_app/core/extensions/context_extensions.dart';
import 'package:personal_habit_tracker_app/core/navigation/routers.dart';
import 'package:personal_habit_tracker_app/core/widgets/loading_widget.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_state.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/widgets/add_habit_bottom_sheet.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/presentation/pages/profile_feature_widget.dart';
import 'package:sizer/sizer.dart';

class HabitsFeatureScreen extends HookWidget {
  const HabitsFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HabitsCubit>();

    final String formattedDate = DateFormat(
      'd, MMMM yyyy',
    ).format(DateTime.now());

    final String dayName = DateFormat('EEEE').format(DateTime.now());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Habits',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: const ProfileFeatureWidget(),
      ),
      body: BlocBuilder<HabitsCubit, HabitsState>(
        builder: (context, state) {
          switch (state) {
            case HabitsInitialState():
              cubit.getHabitsMethod();
              return const LoadingWidget();
            case HabitsSuccessState():
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          dayName,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),

                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        child: RefreshIndicator(
                          onRefresh: () => cubit.getHabitsMethod(),
                          child: state.habitsList.isEmpty
                              ? const Center(
                                  child: Text("No habits created yet"),
                                )
                              : ListView.separated(
                                  padding: const EdgeInsets.fromLTRB(
                                    20,
                                    30,
                                    20,
                                    100,
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const Gap(15),
                                  itemCount: state.habitsList.length,
                                  itemBuilder: (context, index) {
                                    final habit = state.habitsList[index];

                                    final List<Color> cardColors = [
                                      const Color(0xFFFDE7E7),
                                      const Color(0xFFFFF3E0),
                                      const Color(0xFFE0F2F1),
                                    ];
                                    final Color cardColor =
                                        cardColors[index % cardColors.length];

                                    return Container(
                                      padding: const EdgeInsets.all(18),
                                      decoration: BoxDecoration(
                                        color: cardColor,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  habit.title,
                                                  style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Text(
                                                  'Started: ${DateFormat('MMM d, yyyy').format(DateTime.parse(habit.createdAt))}',
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.history_rounded,
                                              color: Theme.of(context).colorScheme.primary,
                                            ),
                                            onPressed: () => context.push(
                                              Routes.habitLogs,
                                              extra: habit.id,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete_outline_rounded,
                                              color: Colors.redAccent,
                                            ),
                                            onPressed: () =>
                                                cubit.deleteHabit(habit.id),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            case HabitsErrorState():
              return const Center(
                child: Text(
                  'Error loading habits',
                  style: TextStyle(color: Colors.white),
                ),
              );
          }
          return const SizedBox();
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 4,
        onPressed: () {
          context.showBottomSheet(
            height: 75.sh,
            widget: BlocProvider.value(
              value: context.read<HabitsCubit>(),
              child: const AddHabitBottomSheet(),
            ),
          );
        },
        label: const Text(
          'Add Habit',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
