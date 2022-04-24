import 'package:flutter/material.dart';

class AboutContent extends StatelessWidget {
  final String text;
  const AboutContent({
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
