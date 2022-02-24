import 'package:aima/database/sqlite/DAO/ciclo.dao.dart';
import 'package:aima/domain/entities/ciclo.model.dart';
import 'package:aima/ui/pages/home/widgets/sem_ciclo.widget.dart';
import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistrosCiclosPage extends StatefulWidget {
  @override
  State<RegistrosCiclosPage> createState() => _RegistrosCiclosPageState();
}

class _RegistrosCiclosPageState extends State<RegistrosCiclosPage> {
  String _dataAtual = DateFormat('dd/MM/yyyy').format(DateTime.now());

  Future<List<CicloModel>> _buscarCicloAtual() async {
    return CicloDAO().findAll();
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
                label: "Ciclos registrados",
                textStyleSub: Theme.of(context).textTheme.subtitle1,
              ),
              body: Center(
                child: (ciclo!.length > 0)
                    ? ListView.builder(
                        itemCount: ciclo.length,
                        itemBuilder: (context, i) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).errorColor,
                            ),
                            child: Column(
                              children: [
                                Text("Data de ínicio: " + ciclo[i].dataInicio),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Ver detalhes"))
                              ],
                            ),
                          );
                        })
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
