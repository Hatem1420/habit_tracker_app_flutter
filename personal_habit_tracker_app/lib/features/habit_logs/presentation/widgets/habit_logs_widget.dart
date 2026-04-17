
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HabitLogCard extends StatefulWidget {
  const HabitLogCard({
    super.key,
    required this.title,
    required this.date,
    required this.isCompleted,
  });

  final String title;
  final String date;
  final bool isCompleted;

  @override
  State<HabitLogCard> createState() => _HabitLogCardState();
}

class _HabitLogCardState extends State<HabitLogCard> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    final completed = isChecked;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
        color: completed ? const Color(0xffECE7F7) : Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: completed
              ? const Color(0xffCDBEF4)
              : const Color(0xffEAE6F5),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: completed
                  ? const Color(0xffDFECE4)
                  : const Color(0xffE8E0F8),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Icon(
                completed ? Icons.check_rounded : Icons.timelapse_rounded,
                size: 34,
                color: completed
                    ? const Color(0xff35A55C)
                    : const Color(0xff7261F6),
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
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color:
                          completed ? const Color(0xff6E6A73) : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Date: ${widget.date}',
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
                      color: completed
                          ? const Color(0xffDDF1E3)
                          : const Color(0xffE8E0F8),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      completed ? 'Completed' : 'Pending',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: completed
                            ? const Color(0xff35A55C)
                            : const Color(0xff7261F6),
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
              value: isChecked,
              activeColor: const Color(0xffA7A1AE),
              checkColor: Colors.white,
              side: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              onChanged: isChecked
                  ? null
                  : (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
            ),
          ),
        ],
      ),
    );
  }
}