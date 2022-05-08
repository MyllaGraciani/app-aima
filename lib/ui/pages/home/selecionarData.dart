import 'package:aima/controllers/valueNotifier.dart';
import 'package:aima/ui/pages/notas/widget/elevated.btn.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelecionarDataPage extends StatelessWidget {
  const SelecionarDataPage({Key? key}) : super(key: key);

  formatarData(data) {
    if (data is String) {
      return DateFormat('dd/MM/yyyy').parse(data);
    } else {
      return DateFormat('dd/MM/yyyy').format(data);
    }
  }

  atualizarDataAtual(dataSelecionada) {
    dataAtual.value = dataSelecionada;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Column(
          children: [
            CalendarDatePicker(
                initialDate: formatarData(dataAtual.value),
                firstDate: DateTime(1998, 01, 01),
                lastDate: DateTime(2100, 12, 12),
                onDateChanged: (date) {
                  String dataSelecionada = formatarData(date);
                  atualizarDataAtual(dataSelecionada);
                }),
            ElevatedBtn(name: 'Selecionar', namedRoute: '/home')
          ],
        ),
      ),
    ));
  }
}
