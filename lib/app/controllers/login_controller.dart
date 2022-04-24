import 'package:flutter/cupertino.dart';
import 'package:rnc_mobile/app/models/login_user.dart';
import 'package:rnc_mobile/dependency_injection.dart';

import '../repositories/auth_repository.dart';

class LoginController {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future login() async {
    final email = emailController.text;
    final password = passwordController.text;

    final user = LoginUser(
      email: email,
      password: password,
    );

    await _authRepository.login(user);
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
