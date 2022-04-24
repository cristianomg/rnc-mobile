import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/componentes/line_separetor.dart';

import '../../../../models/ocurrence_register.dart';

class OcurrenceDetailModal extends StatefulWidget {
  final Future<OcurrenceRegister> ocurrence;

  const OcurrenceDetailModal({Key? key, required this.ocurrence})
      : super(key: key);

  @override
  State<OcurrenceDetailModal> createState() => _OcurrenceDetailModalState();
}

class _OcurrenceDetailModalState extends State<OcurrenceDetailModal> {
  _stateManagement(dynamic snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.active:
      case ConnectionState.done:
        if (snapshot.hasError) {
          return const SizedBox(
            height: double.infinity,
            child: Center(
              child: Text('Erro ao carregar dados'),
            ),
          );
        }
        return const Text("aqui");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  const Text('Detalhes'),
                  const LineSeparetor(),
                  FutureBuilder(
                    future: widget.ocurrence,
                    builder: (BuildContext context, snapshot) {
                      return _stateManagement(snapshot);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
    );
  }
}
