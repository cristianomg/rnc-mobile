import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/layout/main_layout.dart';

import '../../componentes/line_separetor.dart';
import '../../componentes/rnc_buttom.dart';
import '../about/about_page.dart';
import 'componentes/login_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  _openAbout(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return const AboutPage();
        },
        fullscreenDialog: true));
  }

  _openRecoveryPassword(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/recovery-password');
  }

  _openNewAccount(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/new-account');
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
                const LoginTextField(
                  label: "Email",
                  hint: "Ex: joaopassos@souunit.com.br",
                  suffixIcon: Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                const LoginTextField(
                  label: "Senha",
                  hint: "",
                  suffixIcon: Icon(Icons.key),
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
                    onPressed: () {},
                  ),
                ),
                const LineSeparetor(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Não possui conta?',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _openNewAccount(context);
                      },
                      child: const Text(
                        'Cadastre-se',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
