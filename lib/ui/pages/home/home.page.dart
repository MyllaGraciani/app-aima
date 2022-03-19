import 'package:aima/config/app.size.dart';
import 'package:aima/config/configuracoes.dart';
import 'package:aima/database/sqlite/DAO/ciclo.dao.dart';
import 'package:aima/domain/entities/ciclo.model.dart';
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
  String _dataAtual = Configuracoes().dataAtual;

  Future<List<CicloModel>> _buscarCicloAtual() async {
    return CicloDAO().findCicloAtual();
  }

  String diaCiclo(String dataInicio) {
    DateTime? iniciociclo = DateFormat('dd/MM/yyyy').parse(dataInicio);
    DateTime? dAtual = DateFormat('dd/MM/yyyy').parse(_dataAtual);
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
            return Scaffold(
              appBar: AppBarWidget(
                label: _dataAtual,
                textStyleSub: Theme.of(context).textTheme.subtitle1,
              ),
              body: Center(
                child: (ciclo!.length > 0)
                    ? ListView(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Fim da menstruação")),
                                Container(
                                    padding: EdgeInsets.all(
                                        SizeConfig.of(context)
                                            .dynamicScalePadding(value: 0.1)),
                                    child: CicloDiaWidget(
                                      diaCiclo: diaCiclo(ciclo[0].dataInicio),
                                    )),
                                RegistroDoDiaWidget(),
                              ],
                            ),
                          ),
                        ],
                      )
                    : SemCiloWidget(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
