// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ResultAlert extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String message;

  const ResultAlert(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        FlatButton(
          child: const Text('Ok'),
          onPressed: onPressed,
        )
      ],
    );
  }
}
