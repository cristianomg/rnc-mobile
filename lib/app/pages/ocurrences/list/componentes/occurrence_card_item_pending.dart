import 'package:flutter/material.dart';

class OcurrenceCardItemPending extends StatelessWidget {
  final int value;
  final bool isDelayed;
  const OcurrenceCardItemPending(
      {Key? key, required this.value, required this.isDelayed})
      : super(key: key);

  String _buildLabel(int pendingId, bool isDelayed) {
    switch (pendingId) {
      case 1:
        const pendency = 'Análise de Causa Raiz';
        return isDelayed
            ? 'Pendência em atraso: $pendency'
            : 'Pendência: $pendency';
      case 2:
        const pendency = 'Classificação de Risco';
        return isDelayed
            ? 'Pendência em atraso: $pendency'
            : 'Pendência: $pendency';
      case 3:
        const pendency = 'Verificação de Efetividade';
        return isDelayed
            ? 'Pendência em atraso: $pendency'
            : 'Pendência: $pendency';
      default:
        return 'Pendência: Nenhuma';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          _buildLabel(value, isDelayed),
          style: const TextStyle(fontSize: 15),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
