import 'package:aima/database/sqlite/DAO/tiposNotas.dao.dart';
import 'package:aima/domain/entities/tipo_notas.model.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

import 'widget/semItens.widget.dart';

class RemoveCategoriaPage extends StatefulWidget {
  @override
  State<RemoveCategoriaPage> createState() => _RemoveCategoriaPageState();
}

class _RemoveCategoriaPageState extends State<RemoveCategoriaPage> {
  List _selecteItem = [];

  Future<List<TipoNotasModel>> _buscar() async {
    return TipoNotasDAO().find();
  }

  _removerCategorias() async {
    for (int i = 0; i < _selecteItem.length; i++) {
      await TipoNotasDAO().remover(_selecteItem[i]);
    }
  }

  _removerCategoria(int id) async {
    return TipoNotasDAO().remover(id);
  }

  void _onEstadoSelected(bool selected, idEstado) {
    if (selected == true) {
      setState(() {
        _selecteItem.add(idEstado);
      });
    } else {
      setState(() {
        _removerCategoria(idEstado);
        _selecteItem.remove(idEstado);
      });
    }
  }

  @override
  void initState() {
    _buscar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<TipoNotasModel>>(
          future: _buscar(),
          builder: (context, futuro) {
            if (futuro.hasData) {
              List<TipoNotasModel>? estado = futuro.data;
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Remover categorias',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  centerTitle: true,
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
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                    onChanged: (selected) {
                                      _onEstadoSelected(
                                          selected!, estado[i].id);
                                    },
                                    secondary: IconButton(
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        _onEstadoSelected(false, estado[i].id);
                                        _removerCategoria(estado[i].id);
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ),
                                );
                              },
                            )
                          : SemItens(),
                    ),
                    ButtonWidgetGeneric(
                      typeButton: ElevatedButton(
                        onPressed: () async {
                          _removerCategorias();
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: Text("remover todas selecionadas"),
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
