import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  const InputFormField({
    Key? key,
    this.onSaved,
    this.validator,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: (value) => (validator == null) ? null : validator!(value),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFB9B8B8),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFF757575),
        ),
      ),
      onSaved: (value) => (onSaved == null) ? null : onSaved!(value),
      obscureText: obscureText,
    );
  }
}
