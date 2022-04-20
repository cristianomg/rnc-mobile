import 'package:flutter/material.dart';

class LineSeparetor extends StatelessWidget {
  const LineSeparetor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: double.infinity,
      height: 8,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black26,
            width: 1,
          ),
        ),
      ),
    );
  }
}
