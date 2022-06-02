import 'package:aima/config/app.color.dart';
import 'package:aima/config/app.size.dart';
import 'package:aima/controllers/valueNotifier.dart';
import 'package:aima/database/sqlite/DAO/ciclo.dao.dart';
import 'package:aima/domain/entities/ciclo.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelecionarDataPage extends StatelessWidget {
  SelecionarDataPage({Key? key}) : super(key: key);

  final MaterialStateProperty<Color> colorButton =
      MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.primaryColor;
    } else {
      return AppColors.primaryColor.withOpacity(0.1);
    }
  });

  final MaterialStateProperty<Color> colorButtonSeeDay =
      MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.primaryColor;
    } else {
      return AppColors.lightColor.withOpacity(0.9);
    }
  });

  static const double paddingButton = 0.03;

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalendarDatePicker(
                initialDate: formatarData(dataAtual.value),
                firstDate: DateTime(1998, 01, 01),
                lastDate: DateTime(2100, 12, 12),
                onDateChanged: (date) {
                  String dataSelecionada = formatarData(date);
                  atualizarDataAtual(dataSelecionada);
                }),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.of(context)
                      .dynamicScalePadding(value: paddingButton)),
              width: Size.infinite.width,
              child: TextButton.icon(
                style: ButtonStyle(
                  backgroundColor: colorButton,
                ),
                onPressed: () {},
                icon: Icon(Icons.add_circle_outline),
                label: Text('inicio nova menstruação nesse dia'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.of(context)
                      .dynamicScalePadding(value: paddingButton)),
              width: Size.infinite.width,
              child: TextButton.icon(
                onPressed: () {
                  CicloDAO().iniciarCiclo(dataAtual.value, "atual");
                  CicloDAO().findAll().then((ciclos) {
                    for (CicloModel ciclo in ciclos) {
                      for (int i = 0; i < ciclos.length; i++) {
                        print('id ' + ciclo.id.toString());
                        print('dataInicio ' + ciclo.dataInicio.toString());
                        print('dataInicioPM  ' + ciclo.dataInicioPM.toString());
                        print('dataFimPM ' + ciclo.dataFimPM.toString());
                        print('dataInicioPF ' + ciclo.dataInicioPF.toString());
                        print('dataFimPF ' + ciclo.dataFimPF.toString());
                        print('status ' + ciclo.status.toString());
                      }
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: colorButton,
                ),
                icon: Icon(Icons.check_circle_outline_outlined),
                label: Text('fim da menstruação nesse dia'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.of(context)
                      .dynamicScalePadding(value: paddingButton)),
              width: Size.infinite.width,
              child: TextButton.icon(
                onPressed: () => Navigator.of(context).pushNamed('/home'),
                style: ButtonStyle(
                  backgroundColor: colorButtonSeeDay,
                ),
                icon: Icon(Icons.search),
                label: Text('ver registros desse dia'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
