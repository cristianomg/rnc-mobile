import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/core/constants.dart';

import '../../../../componentes/confirmation_dialog.dart';

class OcurrenceCardHeader extends StatelessWidget {
  final VoidCallback onConfirmation;
  const OcurrenceCardHeader({
    Key? key,
    required this.onConfirmation,
  }) : super(key: key);

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
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ConfirmationDialog(
                          message: 'Deseja remover essa ocorrência?',
                          onPressed: onConfirmation,
                        );
                      });
                },
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
