import 'package:flutter/material.dart';

class RncDropDownButton<T> extends StatelessWidget {
  final ValueChanged<T?>? onChanged;
  final String label;
  final List<DropdownMenuItem<T>> items;
  final T selectedItem;
  const RncDropDownButton({
    Key? key,
    required this.label,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: selectedItem,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black26,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black26,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      style: const TextStyle(color: Colors.black38),
    );
  }
}
