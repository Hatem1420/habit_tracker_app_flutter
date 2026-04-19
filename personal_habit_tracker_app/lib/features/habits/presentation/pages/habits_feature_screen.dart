import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('My Habits'),
        centerTitle: true,
        leading: ProfileFeatureWidget(),
      ),

      body: SafeArea(
        child: BlocBuilder<HabitsCubit, HabitsState>(
          builder: (context, state) {
            switch (state) {
              case HabitsInitialState():
                cubit.getHabitsMethod();
                return const LoadingWidget();
              case HabitsSuccessState():
                return Column(
                  spacing: 10,
                  mainAxisSize: .max,
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    state.habitsList.isEmpty
                        ? Expanded(
                            child: const Center(
                              child: Text(" No items yet ..."),
                            ),
                          )
                        : Expanded(
                            child: RefreshIndicator(
                              onRefresh: () => cubit.getHabitsMethod(),
                              child: ListView.separated(
                                padding: const EdgeInsets.all(8),
                                separatorBuilder: (context, index) =>
                                    const Gap(10),
                                itemCount: state.habitsList.length,
                                itemBuilder: (context, index) {
                                  final habit = state.habitsList[index];

                                  return Container(
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.outline,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffE8E0F8),
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.local_fire_department_rounded,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
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
                                              icon: Icon(
                                                Icons.more_vert,
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                              ),
                                              onPressed: () {
                                                context.push(
                                                  Routes.habitLogs,
                                                  extra: habit.id,
                                                );
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
                          ),
                    FilledButton.icon(
                      onPressed: () {
                        context.showBottomSheet(
                          height: 75.sh,
                          widget: BlocProvider.value(
                            value: context.read<HabitsCubit>(),
                            child: const AddHabitBottomSheet(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor: .all(
                          Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      label: const Text('Add'),
                      icon: Icon(Icons.add),
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
