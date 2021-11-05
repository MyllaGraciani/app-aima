import 'package:aima/database/sqlite/DAO/registroDiario.dao.dart';
import 'package:aima/domain/entities/registro_dia.model.dart';
import 'package:aima/ui/pages/home/widgets/sem_registro.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItensRegistradosWidget extends StatefulWidget {
  const ItensRegistradosWidget({Key? key}) : super(key: key);

  @override
  _ItensRegistradosWidgetState createState() => _ItensRegistradosWidgetState();
}

class _ItensRegistradosWidgetState extends State<ItensRegistradosWidget> {
  String _dataAtual = DateFormat('dd/MM/yyyy').format(DateTime.now());

  Future<List<RegistroDiarioModel>> _buscarRegistro(String dataNow) async {
    return RegistroDiarioDAO().selectRegistroDiario(dataNow);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RegistroDiarioModel>>(
      future: _buscarRegistro(_dataAtual),
      builder: (context, futuro) {
        if (futuro.hasData) {
          List<RegistroDiarioModel>? registroDoDia = futuro.data;
          return Container(
            height: 100,
            child: Center(
              child: (registroDoDia!.length > 0)
                  ? ListView(
                      children: [],
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

// Container(
//                         child: Column(
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.95,
//                               height: 200,
//                               decoration: BoxDecoration(
//                                 color: Colors.amber,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(10),
//                                 ),
//                               ),
//                               child: Column(
//                                 children: [
//                                   Text(registroDoDia[0].dataRegistro),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
