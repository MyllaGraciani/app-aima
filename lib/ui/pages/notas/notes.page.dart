import 'package:aima/config/app.color.dart';
import 'package:aima/config/app.size.dart';
import 'package:aima/database/sqlite/DAO/tiposNotas.dao.dart';
import 'package:aima/domain/entities/tipo_notas.model.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  Future<List<TipoNotasModel>> _buscarTiposNotas() async {
    return TipoNotasDAO().find();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<TipoNotasModel>>(
        future: _buscarTiposNotas(),
        builder: (context, future) {
          List<TipoNotasModel>? tiposNotas = future.data;
          if (future.hasData) {
            return Container(
              height: 300,
              margin: EdgeInsets.all(
                  SizeConfig.of(context).dynamicScalePadding(value: 0.03)),
              child: Center(
                child: (tiposNotas!.length > 0)
                    ? GridView.builder(
                        itemCount: tiposNotas.length,
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
                            child: Text(tiposNotas[i].descricao),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 1.5 / 0.6,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                      )
                    : Center(child: CircularProgressIndicator()),
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
