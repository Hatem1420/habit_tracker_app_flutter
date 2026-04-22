import 'package:flutter/material.dart';

class SignSwitchWidget extends StatelessWidget {
  final bool signIn;
  final Function(bool) onChangeSelect;
  const SignSwitchWidget({super.key, required this.signIn, required this.onChangeSelect});

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      style: ButtonStyle(
        animationDuration: Duration(milliseconds: 500),
        side: .all(.none),
        padding: .all(.symmetric(horizontal: 16)),
        textStyle: .all(Theme.of(context).textTheme.titleMedium),
        foregroundColor: .all(Theme.of(context).colorScheme.onSurface),
        backgroundColor: .resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
        ),
      ),
      showSelectedIcon: false,
      segments: [
        const ButtonSegment(value: true, label: Text('Sign In')),
        const ButtonSegment(value: false, label: Text('Sign Up')),
      ],
      selected: {signIn},
      onSelectionChanged: (value) => onChangeSelect(value.last),
    );
  }
}
