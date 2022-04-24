import 'package:flutter/material.dart';
import 'package:rnc_mobile/routes.dart';

import 'app/core/constants.dart';
import 'app/pages/splash/splash_page.dart';
import 'dependency_injection.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const SplashPage(),
    );
  }
}
