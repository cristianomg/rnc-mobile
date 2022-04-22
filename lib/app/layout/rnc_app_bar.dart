import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants.dart';
import '../pages/login/login_page.dart';
import '../pages/profile/profile_page.dart';

class RncAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RncAppBar({
    Key? key,
  }) : super(key: key);

  _onSelected(BuildContext context, String value) async {
    switch (value) {
      case 'profile':
        Navigator.of(context).pushReplacementNamed(ProfilePage.routeName);
        break;
      case 'logout':
        final prefs = await SharedPreferences.getInstance();
        prefs.clear();

        Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(kSecundary_color),
      elevation: 0,
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) async {
            await _onSelected(context, value);
          },
          icon: const Icon(Icons.more_horiz),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.person, color: Color(kSecundary_color)),
                  SizedBox(width: 20),
                  Text(
                    'Meu Perfil',
                    style: TextStyle(
                      color: Color(kSecundary_color),
                    ),
                  ),
                ],
              ),
              value: 'profile',
            ),
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.exit_to_app, color: Color(kSecundary_color)),
                  SizedBox(width: 20),
                  Text(
                    'Sair',
                    style: TextStyle(
                      color: Color(kSecundary_color),
                    ),
                  ),
                ],
              ),
              value: 'logout',
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
