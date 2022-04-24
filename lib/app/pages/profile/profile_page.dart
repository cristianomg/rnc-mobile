// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/componentes/line_separetor.dart';
import 'package:rnc_mobile/app/layout/rnc_app_bar.dart';
import 'package:rnc_mobile/app/layout/rnc_drawer.dart';

import '../../controllers/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final ProfileController controller;

  static const String routeName = '/profile';
  const ProfilePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _fillData();
    });
  }

  _fillData() async {
    setState(() {
      widget.controller.init();
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RncAppBar(),
      drawer: const RncDrawer(),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 20),
              child: Text('Meu Perfil'),
            ),
            Card(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileCardItem(
                      label: 'Nome',
                      controller: widget.controller.nameController,
                    ),
                    ProfileCardItem(
                      label: 'E-mail',
                      controller: widget.controller.emailController,
                    ),
                    ProfileCardItem(
                      label: 'Matricula',
                      controller: widget.controller.enrollmentController,
                    ),
                    ProfileCardItem(
                      label: 'Setor',
                      controller: widget.controller.sectorController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const LineSeparetor(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          padding: const EdgeInsets.all(3),
                          color: const Color(0xffFFDE59),
                          onPressed: () {},
                          child: SizedBox(
                            width: 150,
                            child: Row(
                              children: const [
                                Icon(Icons.edit),
                                Text(
                                  'ALTERAR DADOS',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileCardItem extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const ProfileCardItem({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(label),
          ),
        ),
        SizedBox(
          width: 240,
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 16),
            readOnly: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
