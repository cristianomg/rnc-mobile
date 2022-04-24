import 'package:flutter/material.dart';
import 'package:rnc_mobile/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/core/constants.dart';
import 'app/pages/home/home_page.dart';
import 'app/pages/login/login_page.dart';
import 'dependency_injection.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _initialRoute = LoginPage.routeName;

  _getInitialRoute() async {
    final prefs = await getIt.getAsync<SharedPreferences>();

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
