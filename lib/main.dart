import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/pages/profile/profile_page.dart';
import 'package:rnc_mobile/app/pages/register/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/controllers/login_controller.dart';
import 'app/controllers/register_controller.dart';
import 'app/core/constants.dart';
import 'app/pages/home/home_page.dart';
import 'app/pages/login/login_page.dart';
import 'app/pages/recoveryPassword/recovery_password_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = {
    LoginPage.routeName: (BuildContext context) =>
        LoginPage(controller: LoginController()),
    HomePage.routeName: (BuildContext context) => const HomePage(),
    ProfilePage.routeName: (BuildContext context) => const ProfilePage(),
    RecoveryPasswordPage.routeName: (buildContext) =>
        const RecoveryPasswordPage(),
    RegisterPage.routeName: (buildContext) => RegisterPage(
          controller: RegisterController(),
        ),
  };

  String? _initialRoute = LoginPage.routeName;

  _getInitialRoute() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _initialRoute = prefs.getBool(klogged_in) ?? false
          ? HomePage.routeName
          : LoginPage.routeName;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getInitialRoute();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(kPrimary_color),
            ),
        fontFamily: 'Roboto',
        backgroundColor: const Color(kPrimary_color),
      ),
      routes: routes,
      initialRoute: _initialRoute,
    );
  }
}
