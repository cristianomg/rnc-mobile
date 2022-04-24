// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/core/constants.dart';

class ConfirmationDialog extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;
  const ConfirmationDialog({
    Key? key,
    required this.message,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * .7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.info_outline,
              color: Color(kPrimary_color),
              size: 80,
            ),
            const Text(
              'Confirmação',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(message),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: onPressed,
                  child: const Text('Confirmar'),
                ),
                const SizedBox(
                  width: 10,
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
