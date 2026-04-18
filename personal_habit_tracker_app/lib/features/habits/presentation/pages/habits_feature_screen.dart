import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_habit_tracker_app/core/extensions/context_extensions.dart';
import 'package:personal_habit_tracker_app/core/navigation/routers.dart';
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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Habits Feature Screen'),
        leading: ProfileFeatureWidget(),
      ),

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
                      Gap(40.sh),
                      const Center(child: Text(" No items yet ...")),
                      Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.showBottomSheet(
                            height: 50.sh,
                            widget: BlocProvider.value(
                              value: context.read<HabitsCubit>(),
                              child: const AddHabitBottomSheet(),
                            ),
                          );
                        },
                        label: const Text('Add'),
                      ),
                      Gap(20),
                    ],
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),

                        separatorBuilder: (context, index) => const Gap(10),

                        itemCount: state.habitsList.length,

                        itemBuilder: (context, index) {
                          final habit = state.habitsList[index];

                          return Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0xffEAE6F5),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffE8E0F8),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: const Icon(
                                    Icons.local_fire_department_rounded,
                                    color: Color(0xff7261F6),
                                  ),
                                ),

                                const Gap(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        habit.title,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Created at: ${habit.createdAt}',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff8D8896),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.more_vert,
                                        color: Color(0xff7261F6),
                                      ),
                                      onPressed: () {
                                        context.push(Routes.habitLogs);
                                      },
                                    ),

                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        cubit.deleteHabit(habit.id);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.showBottomSheet(
                          height: 50.sh,
                          widget: BlocProvider.value(
                            value: context.read<HabitsCubit>(),
                            child: const AddHabitBottomSheet(),
                          ),
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
