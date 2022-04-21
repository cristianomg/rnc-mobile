import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/componentes/line_separetor.dart';
import 'package:rnc_mobile/app/componentes/line_link.dart';
import 'package:rnc_mobile/app/componentes/rnc_buttom.dart';
import 'package:rnc_mobile/app/componentes/rnc_input.dart';
import 'package:rnc_mobile/app/layout/main_layout.dart';

class NewAccountPage extends StatelessWidget {
  const NewAccountPage({Key? key}) : super(key: key);

  _backToLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MainLayout(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'CRIAR CONTA',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const RncInput(label: "Nome", inputType: TextInputType.text),
                const SizedBox(
                  height: 10,
                ),
                const RncInput(
                    label: "Matricula", inputType: TextInputType.number),
                const SizedBox(
                  height: 10,
                ),
                const RncInput(
                  label: "Senha",
                  inputType: TextInputType.text,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                const RncInput(
                  label: "Confirmar Senha",
                  obscureText: true,
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                const RncInput(
                  label: "Email",
                  obscureText: true,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 40,
                ),
                RncButtom(
                  text: 'Cadastrar',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
                const LineSeparetor(),
                LineLink(
                  onPressed: () {
                    _backToLogin(context);
                  },
                  text: 'Já possui uma conta?',
                  linkText: 'Voltar ao login',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
