import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/componentes/line_separetor.dart';
import 'package:rnc_mobile/app/componentes/line_link.dart';
import 'package:rnc_mobile/app/componentes/rnc_buttom.dart';
import 'package:rnc_mobile/app/componentes/rnc_input.dart';
import 'package:rnc_mobile/app/layout/main_layout.dart';
import 'package:rnc_mobile/app/pages/login/login_page.dart';

import '../../componentes/result_alert.dart';
import '../../componentes/rnc_dropdownbutton.dart';
import '../../controllers/register_controller.dart';
import '../../models/role.dart';
import '../../models/setor.dart';

class RegisterPage extends StatefulWidget {
  final RegisterController controller;
  static const String routeName = '/register';

  const RegisterPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  _backToLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _populateSetores();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _populateSetores();
    });
  }

  _populateSetores() async {
    final setores = await widget.controller.getSetoresAsync();
    setState(() {
      widget.controller.setores.addAll(setores);
    });
  }

  _onSubmit() async {
    try {
      await widget.controller.register();
      showDialog(
        context: context,
        builder: (context) => ResultAlert(
          title: 'Cadastro',
          message: 'Cadastro realizado com sucesso!',
          onPressed: () {
            _backToLogin(context);
          },
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => ResultAlert(
            onPressed: () {
              Navigator.of(context).pop();
            },
            title: 'Erro',
            message: e.toString().replaceAll('Exception: ', '')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MainLayout(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'CRIAR CONTA',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RncInput(
                      controller: widget.controller.nameFieldController,
                      label: "Nome",
                      inputType: TextInputType.text),
                  const SizedBox(
                    height: 5,
                  ),
                  RncInput(
                      controller: widget.controller.enrollmentFieldController,
                      label: "Matricula",
                      inputType: TextInputType.number),
                  const SizedBox(
                    height: 10,
                  ),
                  RncDropDownButton<Role>(
                    onChanged: (value) {
                      setState(() {
                        widget.controller.setSelectedRole(value!);
                      });
                    },
                    label: "Cargo",
                    items: widget.controller.roles
                        .map((e) =>
                            DropdownMenuItem(child: Text(e.label), value: e))
                        .toList(),
                    selectedItem: widget.controller.selectedRole,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RncDropDownButton<Setor>(
                    onChanged: (value) {
                      setState(() {
                        widget.controller.setSelectedSetor(value!);
                      });
                    },
                    label: "Setor",
                    items: widget.controller.setores
                        .map((e) => DropdownMenuItem(
                            child: Text(e.name ?? ''), value: e))
                        .toList(),
                    selectedItem: widget.controller.selectedSetor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RncInput(
                    controller: widget.controller.passwordFieldController,
                    label: "Senha",
                    inputType: TextInputType.text,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RncInput(
                    controller:
                        widget.controller.confirmPasswordFieldController,
                    label: "Confirmar Senha",
                    obscureText: true,
                    inputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RncInput(
                    controller: widget.controller.emailFieldController,
                    label: "Email",
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RncButtom(
                    text: 'Cadastrar',
                    onPressed: _onSubmit,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const LineSeparetor(),
                  LineLink(
                    onPressed: () {
                      _backToLogin(context);
                    },
                    text: 'Já possui uma conta?',
                    linkText: 'Voltar ao login',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }
}
