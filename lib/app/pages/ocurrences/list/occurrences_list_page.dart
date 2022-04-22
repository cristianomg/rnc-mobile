import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/componentes/line_separetor.dart';
import 'package:rnc_mobile/app/componentes/rnc_buttom.dart';
import 'package:rnc_mobile/app/core/constants.dart';
import 'package:rnc_mobile/app/models/ocurrence_register.dart';
import 'package:rnc_mobile/app/pages/ocurrences/list/componentes/occurrence_card_item_pending.dart';
import 'package:rnc_mobile/app/pages/ocurrences/list/componentes/ocurrence_card_item.dart';

import '../../../controllers/ocurrence_list_controller.dart';
import '../../../layout/rnc_app_bar.dart';
import '../../../layout/rnc_drawer.dart';
import 'package:intl/intl.dart';

import 'componentes/ocurrence_card_header.dart';

class OcurrenceListPage extends StatefulWidget {
  static const String routeName = '/ocurrences/list';
  final OcurrenceListController controller;
  const OcurrenceListPage({Key? key, required this.controller})
      : super(key: key);

  @override
  State<OcurrenceListPage> createState() => _OcurrenceListPageState();
}

class _OcurrenceListPageState extends State<OcurrenceListPage> {
  _stateManagement(AsyncSnapshot<List<OcurrenceRegister>> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.active:
      case ConnectionState.done:
        if (snapshot.hasError) {
          return const Center(
            child: Text('Erro ao carregar dados'),
          );
        }
        return _buildList(snapshot.data!);
    }
  }

  _buildList(List<OcurrenceRegister> registers) {
    return Expanded(
      child: ListView.builder(
        itemCount: registers.length,
        itemBuilder: (BuildContext context, int index) {
          final register = registers[index];
          final DateFormat formatter = DateFormat('dd/MM/yyyy');
          return Card(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  const OcurrenceCardHeader(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Column(
                      children: [
                        OcurrenceCardItem(
                          label: 'Nome',
                          value: register.userName ?? '',
                        ),
                        OcurrenceCardItem(
                          label: 'Classificação',
                          value: register.occurrenceClassification ?? '',
                        ),
                        OcurrenceCardItem(
                          label: 'Data',
                          value:
                              formatter.format(DateTime.parse(register.date!)),
                        ),
                        OcurrenceCardItem(
                          label: 'Setor',
                          value: register.setor ?? '',
                        ),
                        OcurrenceCardItemPending(
                            value: register.occurrencePendency.toString()),
                        const LineSeparetor(),
                        SizedBox(
                          width: 100,
                          child: RncButtom(
                              text: 'Analisar',
                              icon: const Icon(Icons.info),
                              onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const RncAppBar(),
        drawer: const RncDrawer(),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 32, bottom: 20),
                child: Text('Ocorrências Cadastradas',
                    style: TextStyle(
                      color: Color(kSecundary_color),
                      fontWeight: FontWeight.bold,
                    )),
              ),
              FutureBuilder(
                future: widget.controller.getOcurrencesRegisters(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<OcurrenceRegister>> snapshot) {
                  return _stateManagement(snapshot);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
