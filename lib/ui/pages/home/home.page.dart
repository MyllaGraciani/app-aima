import 'package:aima/config/app.size.dart';
import 'package:aima/controllers/valueNotifier.dart';
import 'package:aima/database/sqlite/DAO/ciclo.dao.dart';
import 'package:aima/domain/entities/ciclo.model.dart';
import 'package:aima/ui/pages/home/widgets/floating_btn.widget.dart';
import 'package:aima/ui/pages/home/widgets/registro_do_dia.widget.dart';
import 'package:aima/ui/pages/home/widgets/sem_ciclo.widget.dart';
import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:aima/ui/shared/widgets/ciclo.dia.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  formatarData(data) {
    if (data is String) {
      return DateFormat('dd/MM/yyyy').parse(data);
    } else {
      return DateFormat('dd/MM/yyyy').format(data);
    }
  }

  Future<List<CicloModel>> _buscarCicloAtual() async {
    return CicloDAO().findCicloAtual();
  }

  String diaCiclo(String dataInicio) {
    DateTime iniciociclo = formatarData(dataInicio);
    DateTime dAtual = formatarData(dataAtual.value);
    Duration diaCiclo = dAtual.difference(iniciociclo);
    return diaCiclo.inDays.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<CicloModel>>(
        future: _buscarCicloAtual(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<CicloModel>? ciclo = futuro.data;
            return ValueListenableBuilder(
              valueListenable: dataAtual,
              builder: (context, dataAtual, child) {
                if (dataAtual != null && dataAtual is String) {
                  return Scaffold(
                    appBar: AppBarWidget(
                      label: dataAtual,
                      textStyleSub: Theme.of(context).textTheme.subtitle1,
                    ),
                    body: Center(
                      child: (ciclo!.length > 0)
                          ? ListView(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(
                                              SizeConfig.of(context)
                                                  .dynamicScalePadding(
                                                      value: 0.1)),
                                          child: CicloDiaWidget(
                                            diaCiclo:
                                                diaCiclo(ciclo[0].dataInicio),
                                          )),
                                      RegistroDoDiaWidget(),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : SemCicloWidget(),
                    ),
                    floatingActionButton: FloatingBtnWidget(
                      iconButton: Icon(Icons.edit_calendar_outlined),
                      nameRoute: '/selecionar_data',
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.endTop,
                  );
                } else {
                  return Text("Houve um erro.");
                }
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
