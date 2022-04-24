import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/controllers/ocurrence_list_controller.dart';
import 'package:rnc_mobile/app/controllers/profile_controller.dart';
import 'package:rnc_mobile/app/controllers/register_controller.dart';

import 'app/pages/home/home_page.dart';
import 'app/pages/login/login_page.dart';
import 'app/pages/ocurrences/list/occurrences_list_page.dart';
import 'app/pages/profile/profile_page.dart';
import 'app/pages/recoveryPassword/recovery_password_page.dart';
import 'app/pages/register/register_page.dart';
import 'dependency_injection.dart';

final routes = {
  //
  LoginPage.routeName: (BuildContext context) => const LoginPage(),
  HomePage.routeName: (BuildContext context) => const HomePage(),
  //
  OcurrenceListPage.routeName: (BuildContext context) =>
      OcurrenceListPage(controller: getIt.get<OcurrenceListController>()),
  //
  ProfilePage.routeName: (BuildContext context) => ProfilePage(
        controller: getIt.get<ProfileController>(),
      ),
  //
  RecoveryPasswordPage.routeName: (buildContext) =>
      const RecoveryPasswordPage(),
  //
  RegisterPage.routeName: (buildContext) => RegisterPage(
        controller: getIt.get<RegisterController>(),
      ),
};
