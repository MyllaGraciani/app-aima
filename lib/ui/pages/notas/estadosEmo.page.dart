import 'package:aima/database/sqlite/DAO/estadosEmo.dao.dart';
import 'package:aima/domain/entities/estados_emo.model.dart';
import 'package:aima/ui/pages/notas/addForm.page.dart';
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

  _removerHumor(int id) async {
    return EstadosEmocionaisDAO().remover(id);
  }

  void _onHumorSelected(bool selected, humorId) {
    if (selected == true) {
      setState(() {
        _selecteItem.add(humorId);
      });
    } else {
      setState(() {
        _selecteItem.remove(humorId);
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
              List<EstadosEmocionaisModel>? lista = futuro.data;
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
                      child: (lista!.length > 0)
                          ? ListView.builder(
                              itemCount: lista.length,
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
                                    value: _selecteItem.contains(lista[i].id),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    selected:
                                        _selecteItem.contains(lista[i].id),
                                    activeColor: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(0),
                                    selectedTileColor: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(200),
                                    title: Text(
                                      lista[i].descricao,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    onChanged: (selected) {
                                      _onHumorSelected(selected!, lista[i].id);
                                    },
                                    secondary: IconButton(
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        _onHumorSelected(false, lista[i].id);
                                        _removerHumor(lista[i].id);
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
                        onPressed: () {},
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
