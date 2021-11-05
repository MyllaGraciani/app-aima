import 'package:aima/database/sqlite/DAO/ciclo.dao.dart';
import 'package:aima/database/sqlite/DAO/registroDiario.dao.dart';
import 'package:aima/domain/entities/ciclo.model.dart';
import 'package:aima/domain/entities/registro_dia.model.dart';
import 'package:aima/ui/pages/home/widgets/sem_ciclo.widget.dart';
import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:aima/ui/shared/widgets/ciclo.dia.widget.dart';
import 'package:aima/ui/shared/widgets/list.card.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _dataAtual = DateFormat('dd/MM/yyyy').format(DateTime.now());

  Future<List<RegistroDoDiaModel>> _buscarRegistro(String dataNow) async {
    return RegistroDiarioDAO().find(dataNow);
  }

  Future<List<CicloModel>> _buscarCicloAtual() async {
    return CicloDAO().find();
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
            List<CicloModel>? lista = futuro.data;
            return Scaffold(
              appBar: AppBarWidget(
                label: 'Olá, como você está?',
                textStyleSub: Theme.of(context).textTheme.subtitle1,
              ),
              body: Center(
                child: (lista!.length > 0)
                    ? ListView(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.1),
                                    child: CicloDiaWidget(
                                      diaCiclo: diaCiclo(lista[0].dataInicio),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      )
                    : SemCiloWidget(dataAtual: _dataAtual),
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
