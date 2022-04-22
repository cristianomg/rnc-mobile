import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants.dart';
import '../pages/login/login_page.dart';
import 'rnc_app_bar.dart';

class RncDrawer extends StatefulWidget {
  const RncDrawer({Key? key}) : super(key: key);

  @override
  State<RncDrawer> createState() => _RncDrawerState();
}

class _RncDrawerState extends State<RncDrawer> {
  String? _userName;
  String? _userPermission;
  int? _userPermissionId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _fillUserProperties();
    });
  }

  _fillUserProperties() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = json.decode(prefs.getString(kUser) ?? '')['completeName'];
      _userPermission = prefs.getString(kPermission) ?? '';
      _userPermissionId = prefs.getInt(kPermissionId) ?? 1;
    });
  }

  static final _panels = [
    {
      'title': 'Ocorrências',
      'icon': const Icon(Icons.rule),
      'permission': 1,
      'isExpanded': false,
      'items': [
        {
          'title': 'Cadastrar',
          'icon': const Icon(Icons.add_box),
          'isSelected': false,
          'pageBuilder': LoginPage.routeName
        },
        {
          'title': 'Cadastradas',
          'icon': const Icon(Icons.list),
          'isSelected': false,
          'pageBuilder': LoginPage.routeName
        },
      ],
    },
    {
      'title': 'Pesquisa de Satisfação',
      'icon': const Icon(Icons.person_search),
      'permission': 2,
      'isExpanded': false,
      'items': [
        {
          'title': 'Cadastrar',
          'icon': const Icon(Icons.note_add),
          'isSelected': false,
          'pageBuilder': LoginPage.routeName
        },
        {
          'title': 'Cadastradas',
          'icon': const Icon(Icons.library_books),
          'isSelected': false,
          'pageBuilder': LoginPage.routeName
        },
      ],
    },
    {
      'title': 'Análise',
      'icon': const Icon(Icons.data_saver_off),
      'permission': 3,
      'isExpanded': false,
      'items': [
        {
          'title': 'Gráfico',
          'icon': const Icon(Icons.assessment),
          'isSelected': false,
          'pageBuilder': LoginPage.routeName
        },
        {
          'title': 'Relatório',
          'icon': const Icon(Icons.assignment),
          'isSelected': false,
          'pageBuilder': LoginPage.routeName
        },
      ],
    },
    {
      'title': 'Aprovação de Cadastro',
      'icon': const Icon(Icons.approval),
      'permission': 4,
      'isExpanded': false,
      'items': [],
      'pageBuilder': LoginPage.routeName
    },
  ];

  void _resetPanels() {
    _buildMenuList().forEach((panel) {
      panel['isExpanded'] = false;
      if ((panel['items'] as List).isNotEmpty) {
        for (var item in (panel['items'] as List)) {
          item['isSelected'] = false;
        }
      }
    });
  }

  void _onExpand(index, isExpanded) {
    _resetPanels();

    _buildMenuList()[index]['isExpanded'] = !isExpanded;

    setState(() {});
  }

  void _onSelected(
      Map<String, Object> panel, Map<String, Object> item, bool hasSubItems) {
    _resetPanels();

    if (hasSubItems) {
      panel['isExpanded'] = true;
      item['isSelected'] = true;
    }

    Navigator.of(context).pushReplacementNamed(item['pageBuilder'].toString());
  }

  List<Map<String, Object>> _buildMenuList() {
    final permission = _userPermissionId ?? 1;
    return _panels
        .where((element) => (element['permission'] as int) <= permission)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: const RncAppBar().preferredSize.height,
            color: const Color(kSecundary_color),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logo2.png',
                  height: 40,
                ),
                const SizedBox(width: 20),
                const Text(
                  '4lab',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          DrawerHeader(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ),
                child: Text(_userName ?? ''),
              ),
              Text(_userPermission ?? ''),
            ]),
          ),
          ExpansionPanelList(
            expansionCallback: _onExpand,
            children: _buildMenuList()
                .asMap()
                .map(
                  (index, panel) => MapEntry(
                    index,
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        var hasSubItems = (panel['items'] as List).isNotEmpty;
                        return ListTile(
                          onTap: () {
                            if (hasSubItems) {
                              _onExpand(index, isExpanded);
                            } else {
                              _onSelected(panel, panel, false);
                            }
                          },
                          iconColor: const Color(0xffF5D556),
                          leading: panel['icon'] as Widget,
                          title: Text(
                            panel['title'].toString(),
                          ),
                          selected: isExpanded,
                          dense: true,
                        );
                      },
                      body: Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: (panel['items'] != null
                                  ? panel['items'] as List
                                  : [])
                              .map(
                                (item) => ListTile(
                                  onTap: () => _onSelected(panel, item, true),
                                  style: ListTileStyle.drawer,
                                  iconColor: const Color(0xffF5D556),
                                  leading: item['icon'] as Widget,
                                  title: Text(item['title']),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      isExpanded: panel['isExpanded'] as bool,
                      canTapOnHeader: true,
                    ),
                  ),
                )
                .values
                .toList(),
          )
        ],
      ),
    );
  }
}
