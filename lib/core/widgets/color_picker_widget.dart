import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class ColorPickerWidget extends StatelessWidget {
  final Function(Color) onColorSelect;
  const ColorPickerWidget({super.key, required this.onColorSelect});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ColorPicker(
        color: Theme.of(context).colorScheme.primary,
        onColorChanged: (Color color) {
          onColorSelect(color);
        },
        width: 44,
        height: 44,
        borderRadius: 15,
        heading: Text(
          'Select color',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        subheading: Text(
          'Select color shade',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
