import 'package:flutter/material.dart';
import 'package:personal_habit_tracker_app/core/extensions/context_extensions.dart';
import 'package:personal_habit_tracker_app/core/utils/validators.dart';
import 'package:personal_habit_tracker_app/core/widgets/custom_text_field.dart';
import 'package:personal_habit_tracker_app/core/widgets/date_picker_bottom.dart';
import 'package:sizer/sizer.dart';

class DatePickerField extends StatefulWidget {
  final Function(DateTime) onSubmit;
  final bool? isRequired;
  const DatePickerField({super.key, required this.onSubmit, this.isRequired});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: 'Date Of Birth',
            controller: textEditingController,
            readOnly: true,
            validator: widget.isRequired ?? false
                ? Validators.validateRequired
                : null,
          ),
        ),
        IconButton.filled(
          padding: .zero,
          onPressed: () {
            context.showBottomSheet(
              height: 50.sh,
              widget: DatePickerBottom(
                onSubmit: (date) => setState(() {
                  textEditingController.text = date.toString();
                  widget.onSubmit(date);
                }),
              ),
            );
          },
          icon: Icon(Icons.edit),
        ),
      ],
    );
  }
}
