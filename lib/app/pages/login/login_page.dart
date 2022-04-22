import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/componentes/line_link.dart';
import 'package:rnc_mobile/app/controllers/login_controller.dart';
import 'package:rnc_mobile/app/layout/main_layout.dart';
import 'package:rnc_mobile/app/pages/home/home_page.dart';
import 'package:rnc_mobile/app/pages/recoveryPassword/recovery_password_page.dart';
import 'package:rnc_mobile/app/pages/register/register_page.dart';

import '../../componentes/line_separetor.dart';
import '../../componentes/result_alert.dart';
import '../../componentes/rnc_buttom.dart';
import '../about/about_page.dart';
import 'componentes/login_text_field.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;
  static const String routeName = '/login';
  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _openAbout(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return const AboutPage();
        },
        fullscreenDialog: true,
      ),
    );
  }

  _openRecoveryPassword(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RecoveryPasswordPage.routeName);
  }

  _openNewAccount(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RegisterPage.routeName);
  }

  _onSubmit() async {
    try {
      await widget.controller.login();

      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => ResultAlert(
            onPressed: () {
              Navigator.of(context).pop();
            },
            title: 'Erro',
            message: e.toString().replaceAll('Exception: ', '')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MainLayout(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 45, right: 45, top: 15, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(
                  height: 10,
                ),
                LoginTextField(
                  controller: widget.controller.emailController,
                  label: "Email",
                  hint: "Ex: joaopassos@souunit.com.br",
                  suffixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                LoginTextField(
                  controller: widget.controller.passwordController,
                  label: "Senha",
                  hint: "",
                  suffixIcon: const Icon(Icons.key),
                  keyboardType: TextInputType.text,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        _openAbout(context);
                      },
                      child: const Text('SOBRE o 4Lab',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        _openRecoveryPassword(context);
                      },
                      child: const Text(
                        'ESQUECI MINHA SENHA',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    )
                  ],
                ),
                Center(
                  child: RncButtom(
                    text: "ENTRAR",
                    onPressed: _onSubmit,
                  ),
                ),
                const LineSeparetor(),
                LineLink(
                  linkText: 'Cadastre-se',
                  text: 'Não possui conta?',
                  onPressed: () {
                    _openNewAccount(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }
}
