import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class ProfileController {
  ProfileController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _enrollmentController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get enrollmentController => _enrollmentController;
  TextEditingController get sectorController => _sectorController;

  void init() async {
    final prefs = await SharedPreferences.getInstance();

    final userJson = json.decode(prefs.getString(kUser) ?? '{}');

    final user = User.fromJson(userJson);

    _nameController.text = user.completeName ?? '';
    _emailController.text = user.email ?? '';
    _enrollmentController.text = user.enrollment ?? '';
    _sectorController.text = '';
  }

  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _enrollmentController.dispose();
    _sectorController.dispose();
  }
}
