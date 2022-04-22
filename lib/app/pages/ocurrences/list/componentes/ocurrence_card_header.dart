import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/core/constants.dart';

class OcurrenceCardHeader extends StatelessWidget {
  const OcurrenceCardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          color: const Color(kSecundary_color),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 50,
              child: RaisedButton(
                padding: const EdgeInsets.all(0),
                color: const Color(0xffFFDE59),
                onPressed: () {},
                child: const Icon(
                  Icons.delete_outline,
                  color: Color(kSecundary_color),
                  size: 30,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
