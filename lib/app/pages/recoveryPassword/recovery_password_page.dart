import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/componentes/line_separetor.dart';

import '../../componentes/rnc_buttom.dart';
import '../../componentes/rnc_input.dart';
import '../../layout/main_layout.dart';

class RecoveryPasswordPage extends StatelessWidget {
  const RecoveryPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MainLayout(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 45, right: 45, top: 15, bottom: 15),
            child: Column(
              children: [
                const Text(
                  'RECUPERE A SENHA',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 60),
                  child: Text(
                    'Insira o seu email e enviaremos uma nova senha de acesso para a sua conta.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const RncInput(
                  label: 'E-mail',
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 160,
                  child: RncButtom(
                    onPressed: () {},
                    text: 'ENVIAR EMAIL',
                    icon: const Icon(Icons.send),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const LineSeparetor(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: const Text(
                    'Voltar ao login',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
