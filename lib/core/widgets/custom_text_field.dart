import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final bool? isObscure;
  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.readOnly, this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          decoration: InputDecoration(label: Text(label)),
          clipBehavior: .none,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          validator: validator,
          readOnly: readOnly ?? false,
          obscureText: isObscure ?? false,
        ),
      ),
    );
  }
}
