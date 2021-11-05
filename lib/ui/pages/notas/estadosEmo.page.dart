import 'package:aima/database/sqlite/DAO/estadosEmo.dao.dart';
import 'package:aima/domain/entities/estados_emo.model.dart';
import 'package:aima/ui/pages/notas/addForm.page.dart';
import 'package:aima/ui/pages/tabs-menu/tabs.page.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class EstadosEmocionaisPage extends StatefulWidget {
  final int idTipo;

  EstadosEmocionaisPage({required this.idTipo});

  @override
  State<EstadosEmocionaisPage> createState() => _EstadosEmocionaisPageState();
}

class _EstadosEmocionaisPageState extends State<EstadosEmocionaisPage> {
  List _selecteItem = [];

  Future<List<EstadosEmocionaisModel>> _buscar(int idTipo) async {
    return EstadosEmocionaisDAO().find(idTipo);
  }

  _removerEstado(int id) async {
    return EstadosEmocionaisDAO().remover(id);
  }

  void _onEstadoSelected(bool selected, idTipo) {
    if (selected == true) {
      setState(() {
        _selecteItem.add(idTipo);
      });
    } else {
      setState(() {
        _selecteItem.remove(idTipo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<EstadosEmocionaisModel>>(
          future: _buscar(widget.idTipo),
          builder: (context, futuro) {
            if (futuro.hasData) {
              List<EstadosEmocionaisModel>? estado = futuro.data;
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Como você se sente hoje?',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddFormPage(),
                          ),
                        );
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: (estado!.length > 0)
                          ? ListView.builder(
                              itemCount: estado.length,
                              itemBuilder: (context, i) {
                                return Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  child: CheckboxListTile(
                                    dense: true,
                                    contentPadding: const EdgeInsets.all(5),
                                    value: _selecteItem.contains(estado[i].id),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    selected:
                                        _selecteItem.contains(estado[i].id),
                                    activeColor: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(0),
                                    selectedTileColor: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(200),
                                    title: Text(
                                      estado[i].descricao,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    onChanged: (selected) {
                                      _onEstadoSelected(
                                          selected!, estado[i].id);
                                    },
                                    secondary: IconButton(
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        _onEstadoSelected(false, estado[i].id);
                                        _removerEstado(estado[i].id);
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                  child: Text(
                                "Não existe nenhum item ainda, adicione através do sinal de mais =D",
                                style: Theme.of(context).textTheme.headline6,
                              )),
                            ),
                    ),
                    ButtonWidgetGeneric(
                      typeButton: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TabsPage(),
                            ),
                          );
                        },
                        child: Text("SALVAR"),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}