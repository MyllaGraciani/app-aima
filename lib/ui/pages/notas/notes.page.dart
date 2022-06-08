import 'package:aima/config/app.color.dart';
import 'package:aima/config/app.size.dart';
import 'package:aima/database/sqlite/DAO/tiposNotas.dao.dart';
import 'package:aima/domain/entities/tipo_notas.model.dart';
import 'package:aima/ui/pages/notas/estadosEmo.page.dart';
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SizedBox(height: 40, child: Image.asset("assets/logo.png")),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Anotações',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          actionsIconTheme: IconThemeData(color: AppColors.primaryColor),
          actions: [
            PopupMenuButton(
              itemBuilder: ((context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text('adicionar categoria'),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('remover categoria'),
                    ),
                  ]),
              onSelected: (result) {
                if (result == 1) {
                  Navigator.pushNamed(context, '/add_categoria');
                }
                if (result == 2) {
                  Navigator.pushNamed(context, '/rem_categoria');
                }
              },
            ),
          ],
        ),
        body: FutureBuilder<List<TipoNotasModel>>(
          future: _buscarTiposNotas(),
          builder: (context, future) {
            List<TipoNotasModel>? tiposNotas = future.data;
            if (future.hasData) {
              return Container(
                height: MediaQuery.of(context).size.height,
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
                              child: TextButton(
                                child: Text(
                                  tiposNotas[i].descricao +
                                      '\n' +
                                      tiposNotas[i].id.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.backgroundColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                  ),
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
      ),
    );
  }
}
