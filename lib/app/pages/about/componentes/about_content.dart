import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String text;
  const Content({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
      ),
    );
  }
}
