import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final Icon suffixIcon;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;

  const LoginTextField({
    Key? key,
    required this.suffixIcon,
    required this.label,
    required this.hint,
    required this.keyboardType,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black26,
          fontSize: 14,
        ),
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.black,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black26),
        focusColor: const Color(kPrimary_color),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black26,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
