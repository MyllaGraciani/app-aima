import 'package:aima/controllers/valueNotifier.dart';
import 'package:aima/database/sqlite/DAO/registroDiario.dao.dart';
import 'package:aima/domain/entities/registro_dia.model.dart';
import 'package:aima/ui/pages/home/widgets/itens_registrados.widget.dart';
import 'package:aima/ui/pages/home/widgets/sem_registro.widget.dart';
import 'package:flutter/material.dart';

class RegistroDoDiaWidget extends StatefulWidget {
  RegistroDoDiaWidget({Key? key}) : super(key: key);

  @override
  _RegistroDoDiaWidgetState createState() => _RegistroDoDiaWidgetState();
}

class _RegistroDoDiaWidgetState extends State<RegistroDoDiaWidget> {
  Future<List<RegistroDoDiaModel>> _buscarRegistro(String data) async {
    return RegistroDiarioDAO().find(data);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: dataAtual,
        builder: (context, dataAtual, child) {
          if (dataAtual != null && dataAtual is String) {
            return FutureBuilder<List<RegistroDoDiaModel>>(
              future: _buscarRegistro(dataAtual),
              builder: (context, futuro) {
                if (futuro.hasData) {
                  List<RegistroDoDiaModel>? registroDoDia = futuro.data;
                  return Container(
                    child: Center(
                      child: (registroDoDia!.length > 0)
                          ? Column(
                              children: [
                                Text(
                                  "Registros do dia",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                ItensRegistradosWidget(),
                              ],
                            )
                          : SemRegistroWidget(),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return Text("houve um erro");
          }
        });
  }
}
