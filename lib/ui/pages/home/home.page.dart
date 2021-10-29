import 'package:aima/config/app.color.dart';
import 'package:aima/database/sqlite/DAO/registroDiario.dao.dart';
import 'package:aima/domain/entities/registro_dia.model.dart';
import 'package:aima/ui/shared/widgets/appbar.widget.dart';
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

  // Future<List<CicloModel>> _buscarCiclo() async {
  //   return CicloDAO().find();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<RegistroDoDiaModel>>(
        future: _buscarRegistro(_dataAtual),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<RegistroDoDiaModel>? lista = futuro.data;
            return Scaffold(
              appBar: AppBarWidget(
                label: 'Olá, como você está?',
                textStyleSub: Theme.of(context).textTheme.subtitle1,
              ),
              body: Center(
                child: (lista!.length > 0)
                    ? Text("adsadasd")
                    : Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            "Você não cadastrou nenhum ciclo ainda. Inicie um novo ciclo aqui.",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.lightColor.withOpacity(0.4),
                        ),
                      ),
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

// Scaffold(
//       appBar: AppBarWidget(
//         label: 'Olá,',
//         textStyleSub: Theme.of(context).textTheme.subtitle1,
//       ),
//       body: ListView(
//         children: [
//           Container(
//             child: Column(
//               children: [
//                 Container(padding: EdgeInsets.all(16), child: CicloDiaWidget()),
//                 Text(
//                   "Humores",
//                   style: Theme.of(context).textTheme.bodyText1,
//                 ),
//                 ListCardWidget(),
//                 Text(
//                   "Sintomas",
//                   style: Theme.of(context).textTheme.bodyText1,
//                 ),
//                 ListCardWidget(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
