import 'package:flutter/material.dart';

class RncButtom extends StatelessWidget {
  final String text;
  final Icon? icon;
  final VoidCallback? onPressed;

  const RncButtom(
      {Key? key, required this.text, this.icon, required this.onPressed})
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
            style: const TextStyle(
              color: Colors.black,
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
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: _buildLabel(),
        color: const Color(0xffFFDE59),
      ),
    );
  }
}
