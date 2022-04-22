// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/cupertino.dart';
import 'package:rnc_mobile/app/models/register_user.dart';
import 'package:rnc_mobile/app/repositories/setor_repository.dart';
import 'package:rnc_mobile/app/repositories/user_repository.dart';

import '../models/role.dart';
import '../models/setor.dart';

class RegisterController {
  final SetorRepository _setorRepository = SetorRepository();
  final UserRepository _userRepository = UserRepository();
  RegisterController() {
    _selectedRole = _roles[0];
    _selectedSetor = setores[0];
  }

  final _roles = [
    Role(
      label: 'Selecione uma opção...',
      value: '',
    ),
    Role(
      label: 'Funcionário',
      value: 'Employee',
    ),
    Role(
      label: 'Responsável do Setor',
      value: 'ResponsibleFS',
    ),
    Role(
      label: 'Responsável Técnico',
      value: 'ResponsibleT',
    ),
    Role(
      label: 'Analista da Qualidade',
      value: 'QualityAnalist',
    ),
  ];

  List<Role> get roles => _roles;

  late Role _selectedRole;

  Role get selectedRole => _selectedRole;

  void setSelectedRole(Role role) {
    _selectedRole = role;
  }

  late List<Setor> setores = [Setor(name: 'Selecione uma opção...')];

  late Setor _selectedSetor;

  Setor get selectedSetor => _selectedSetor;

  void setSelectedSetor(Setor setor) {
    _selectedSetor = setor;
  }

  Future<List<Setor>> getSetoresAsync() async {
    final setores = await _setorRepository.getAll();

    return setores;
  }

  final TextEditingController nameFieldController = TextEditingController();
  final TextEditingController enrollmentFieldController =
      TextEditingController();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();
  final TextEditingController confirmPasswordFieldController =
      TextEditingController();

  Future register() async {
    final user = RegisterUser(
      completeName: nameFieldController.text,
      email: emailFieldController.text,
      enrollment: enrollmentFieldController.text,
      userPermission: _selectedRole.value,
      password: passwordFieldController.text,
      confirmPassword: confirmPasswordFieldController.text,
      setor: _selectedSetor.id,
    );
    await _userRepository.create(user);
  }

  void dispose() {
    nameFieldController.dispose();
    enrollmentFieldController.dispose();
    emailFieldController.dispose();
    passwordFieldController.dispose();
    confirmPasswordFieldController.dispose();
  }
}
