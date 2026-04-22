import 'package:flutter/material.dart';

class FadeAnimatedContainer extends StatelessWidget {
  final bool fade;
  final Widget widget;
  const FadeAnimatedContainer({
    super.key,
    required this.fade,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 500),
      sizeCurve: Curves.easeInOut,
    //!--------------------------------
      crossFadeState: fade ? .showSecond : .showFirst,
      firstChild: widget,
      secondChild: SizedBox.shrink(),
    );
  }
}
