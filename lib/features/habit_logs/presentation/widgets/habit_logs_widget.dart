import 'package:flutter/material.dart';

class HabitLogCard extends StatelessWidget {
  const HabitLogCard({
    super.key,
    required this.title,
    required this.date,
    required this.isCompleted,
    required this.onChanged,
  });

  final String title;
  final String date;
  final bool isCompleted;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final completed = isCompleted;
    final completedColor = completed
        ? Theme.of(context).disabledColor
        : const Color(0xffE8E0F8);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
        color: completed ? Theme.of(context).disabledColor : null,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: completed
              ? Theme.of(context).disabledColor
              : Theme.of(context).colorScheme.primary,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: completedColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Icon(
                completed ? Icons.check_rounded : Icons.timelapse_rounded,
                size: 34,
                color: completed
                    ? const Color(0xff35A55C)
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Date: $date',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff8D8896),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: completedColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      completed ? 'Completed' : 'Pending',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: completed
                            ? const Color(0xff35A55C)
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: isCompleted,
              activeColor:Theme.of(context).colorScheme.primary,
              checkColor: Colors.white,
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              onChanged: isCompleted ? null : onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
