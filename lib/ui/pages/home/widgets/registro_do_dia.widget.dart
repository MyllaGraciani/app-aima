import 'package:aima/database/sqlite/DAO/registroDiario.dao.dart';
import 'package:aima/domain/entities/registro_dia.model.dart';
import 'package:aima/ui/pages/home/widgets/sem_registro.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'itens_registrados.widget.dart';

class RegistroDoDiaWidget extends StatefulWidget {
  const RegistroDoDiaWidget({Key? key}) : super(key: key);

  @override
  _RegistroDoDiaWidgetState createState() => _RegistroDoDiaWidgetState();
}

class _RegistroDoDiaWidgetState extends State<RegistroDoDiaWidget> {
  String _dataAtual = DateFormat('dd/MM/yyyy').format(DateTime.now());

  Future<List<RegistroDoDiaModel>> _buscarRegistro(String dataNow) async {
    return RegistroDiarioDAO().find(dataNow);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RegistroDoDiaModel>>(
      future: _buscarRegistro(_dataAtual),
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
  }
}
