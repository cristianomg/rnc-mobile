import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final Icon suffixIcon;
  final String label;
  final String hint;
  final TextInputType keyboardType;

  const LoginTextField({
    Key? key,
    required this.suffixIcon,
    required this.label,
    required this.hint,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
        focusColor: const Color(0xff59E5BF),
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
