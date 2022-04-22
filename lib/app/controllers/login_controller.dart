import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rnc_mobile/app/core/constants.dart';
import 'package:rnc_mobile/app/models/login_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/auth_repository.dart';

class LoginController {
  final AuthRepository _authRepository = AuthRepository();
  LoginController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future login() async {
    final prefs = await SharedPreferences.getInstance();
    final email = emailController.text;
    final password = passwordController.text;

    final user = LoginUser(
      email: email,
      password: password,
    );

    final response = await _authRepository.login(user);
    _fillPreferences(prefs, response);
  }

  void _fillPreferences(
      SharedPreferences prefs, Map<dynamic, dynamic> authResponse) {
    prefs.setString(kUser, json.encode(authResponse['user']));
    prefs.setString(kjwt_token, authResponse['token'].toString());
    prefs.setString(kPermission, authResponse['permission'].toString());
    prefs.setBool(klogged_in, true);
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}