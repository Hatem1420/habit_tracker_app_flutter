import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_cubit.dart';

class AddHabitBottomSheet extends HookWidget {
  const AddHabitBottomSheet({super.key}); 

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HabitsCubit>();
    final textController = useTextEditingController();
    final dateController = useTextEditingController();
    final pickedDate = useState<DateTime?>(null);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ), //.vertical(top: Radius.circular(20))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Add New Habit', style: TextStyle(fontSize: 20)),

          Gap(16),

          TextField(
            controller: textController,
            decoration: const InputDecoration(labelText: 'Habit title'),
          ),

          Gap(16),

          TextField(
            controller: dateController,
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Pick date',
              suffixIcon: Icon(Icons.calendar_month),
            ),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );

              if (date != null) {
                pickedDate.value = date;
                dateController.text = "${date.year}-${date.month}-${date.day}";
              }
            },
          ),

          Gap(20),

          ElevatedButton(
            onPressed: () {
              if (textController.text.isEmpty) {
                return;
              }

              cubit.addNewHabit(textController.text);

              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
          Gap(20),
        ],
      ),
    );
  }
}
