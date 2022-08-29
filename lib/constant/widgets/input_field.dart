import 'package:flutter/material.dart';

class InputFormField extends TextFormField {
  InputFormField({
    required hintText,
    super.key,
    super.onSaved,
    super.validator,
    super.keyboardType,
    super.obscureText,
  }) : super(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFB9B8B8),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xFF757575),
            ),
          ),
        );
}
