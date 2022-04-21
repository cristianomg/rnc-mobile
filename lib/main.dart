import 'package:flutter/material.dart';

import 'app/pages/login/login_page.dart';
import 'app/pages/newAccount/new_account_page.dart';
import 'app/pages/recoveryPassword/recovery_password_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = {
    '/login': (BuildContext context) => const LoginPage(),
    '/recovery-password': (buildContext) => const RecoveryPasswordPage(),
    '/new-account': (buildContext) => const NewAccountPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xff59E5BF),
            ),
        fontFamily: 'Roboto',
        backgroundColor: const Color(0xff59E5BF),
      ),
      routes: routes,
      initialRoute: '/login',
    );
  }
}
