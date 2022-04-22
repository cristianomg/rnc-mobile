import 'package:flutter/material.dart';

import '../../../controllers/ocurrence_list_controller.dart';
import '../../../layout/rnc_app_bar.dart';
import '../../../layout/rnc_drawer.dart';

class OcurrenceListPage extends StatefulWidget {
  static const String routeName = '/ocurrences/list';
  final OcurrenceListController controller;
  const OcurrenceListPage({Key? key, required this.controller})
      : super(key: key);

  @override
  State<OcurrenceListPage> createState() => _OcurrenceListPageState();
}

class _OcurrenceListPageState extends State<OcurrenceListPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: RncAppBar(),
        drawer: RncDrawer(),
      ),
    );
  }
}
