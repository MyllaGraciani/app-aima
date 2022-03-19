import 'package:aima/config/app.color.dart';
import 'package:aima/config/app.size.dart';
import 'package:aima/config/configuracoes.dart';
import 'package:aima/database/sqlite/DAO/registroDiario.dao.dart';
import 'package:aima/domain/entities/registro_dia.model.dart';
import 'package:aima/ui/pages/home/widgets/sem_registro.widget.dart';
import 'package:flutter/material.dart';

class ItensRegistradosWidget extends StatefulWidget {
  const ItensRegistradosWidget({Key? key}) : super(key: key);

  @override
  _ItensRegistradosWidgetState createState() => _ItensRegistradosWidgetState();
}

class _ItensRegistradosWidgetState extends State<ItensRegistradosWidget> {
  String _dataAtual = Configuracoes().dataAtual;
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
            height: 300,
            margin: EdgeInsets.all(
                SizeConfig.of(context).dynamicScalePadding(value: 0.03)),
            child: Center(
              child: (registroDoDia!.length > 0)
                  ? GridView.builder(
                      itemCount: registroDoDia.length,
                      itemBuilder: (context, i) {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(SizeConfig.of(context)
                              .dynamicScalePadding(value: 0.01)),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Text(registroDoDia[i].estados),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 1.5 / 0.6,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
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
