import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DatePickerBottom extends StatelessWidget {
  final Function(DateTime) onSubmit;
  const DatePickerBottom({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(bottom: 5.sh),
      child: BottomPicker.date(
        backgroundColor: Colors.transparent,
        buttonSingleColor: Theme.of(context).colorScheme.primary,
        pickerThemeData: CupertinoTextThemeData(
          primaryColor: Theme.of(context).primaryColor,
          dateTimePickerTextStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        headerBuilder: (context) {
          return Text(
            'When did you born ?',
            style: Theme.of(context).textTheme.titleMedium,
          );
        },
        dateOrder: .dmy,
        maxDateTime: DateTime(2015, 12, 31),
        minDateTime: DateTime(1950, 1, 1),
        onSubmit: (value) {
          onSubmit(value);
        },
      ),
    );
  }
}
