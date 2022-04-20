import 'package:flutter/material.dart';

class RncInput extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType inputType;
  final bool obscureText;
  const RncInput({
    Key? key,
    required this.label,
    required this.inputType,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      enableSuggestions: !obscureText,
      autocorrect: !obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
