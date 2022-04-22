import 'package:flutter/material.dart';

class OcurrenceCardItemPending extends StatelessWidget {
  final String value;
  const OcurrenceCardItemPending({Key? key, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          'Pendência: $value',
          style: const TextStyle(fontSize: 15),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
