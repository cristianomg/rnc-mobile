import 'package:flutter/material.dart';

class LineLink extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String linkText;
  const LineLink(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.linkText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            linkText,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
