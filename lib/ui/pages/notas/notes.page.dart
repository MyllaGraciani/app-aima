import 'package:aima/config/app.color.dart';
import 'package:aima/config/app.size.dart';
import 'package:aima/database/sqlite/DAO/tiposNotas.dao.dart';
import 'package:aima/domain/entities/tipo_notas.model.dart';
import 'package:aima/ui/pages/home/widgets/floating_btn.widget.dart';
import 'package:aima/ui/pages/notas/estadosEmo.page.dart';
import 'package:aima/ui/shared/widgets/appbar.widget.dart';
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
      child: Scaffold(
        appBar: AppBarWidget(
          label: 'Anotações',
          textStyleSub: Theme.of(context).textTheme.subtitle1,
        ),
        body: FutureBuilder<List<TipoNotasModel>>(
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
                              child: ElevatedButton(
                                child: Text(
                                  tiposNotas[i].descricao,
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EstadosEmocionaisPage(
                                                idTipo: tiposNotas[i].id)),
                                  );
                                },
                              ),
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
        floatingActionButton: FloatingBtnWidget(
          iconButton: Icon(Icons.add_circle_outline),
          nameRoute: '/add_categoria',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }
}
