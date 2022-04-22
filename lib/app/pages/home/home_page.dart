import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/layout/rnc_drawer.dart';

import '../../layout/rnc_app_bar.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

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
