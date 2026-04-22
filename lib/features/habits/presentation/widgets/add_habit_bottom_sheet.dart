import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_cubit.dart';

class AddHabitBottomSheet extends HookWidget {
  const AddHabitBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HabitsCubit>();
    final textController = useTextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Add New Habit', style: TextStyle(fontSize: 20)),

        Gap(16),

        TextField(
          controller: textController,
          decoration: const InputDecoration(labelText: 'Habit title'),
        ),

        Gap(40),

        FilledButton(
          onPressed: () {
            if (textController.text.isEmpty) {
              return;
            }

            cubit.addNewHabit(textController.text);

            context.pop(context);
          },
          style: ButtonStyle(
            foregroundColor: .all(Theme.of(context).colorScheme.onSurface),
          ),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
