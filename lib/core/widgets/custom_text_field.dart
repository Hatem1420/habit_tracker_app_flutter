import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool? readOnly;
  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        decoration: InputDecoration(label: Text(label)),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        validator: validator,
        readOnly: readOnly ?? false,
      ),
    );
  }
}
