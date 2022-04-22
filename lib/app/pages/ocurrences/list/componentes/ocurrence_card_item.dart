import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class OcurrenceCardItem extends StatelessWidget {
  final String label;
  final String value;
  const OcurrenceCardItem({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              color: Color(kSecundary_color),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 15),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
