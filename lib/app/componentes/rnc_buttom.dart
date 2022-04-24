// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class RncButtom extends StatelessWidget {
  final String text;
  final Icon? icon;
  final bool isDisabled;
  final VoidCallback? onPressed;

  const RncButtom(
      {Key? key,
      required this.text,
      this.icon,
      required this.onPressed,
      this.isDisabled = false})
      : super(key: key);

  Widget _buildLabel() {
    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              color: isDisabled ? Colors.grey[400] : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      );
    }

    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        disabledColor: Colors.grey[300],
        disabledTextColor: Colors.grey[400],
        padding: EdgeInsets.zero,
        onPressed: isDisabled ? null : onPressed,
        onLongPress: isDisabled ? null : onPressed,
        child: _buildLabel(),
        color: const Color(0xffFFDE59),
      ),
    );
  }
}
