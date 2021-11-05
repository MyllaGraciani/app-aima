import 'package:aima/database/sqlite/DAO/estadosEmo.dao.dart';
import 'package:aima/database/sqlite/DAO/registroDiario.dao.dart';
import 'package:aima/domain/entities/estados_emo.model.dart';
import 'package:aima/domain/entities/registro_dia.model.dart';
import 'package:aima/ui/pages/notas/addForm.page.dart';
import 'package:aima/ui/pages/tabs-menu/tabs.page.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EstadosEmocionaisPage extends StatefulWidget {
  final int idTipo;

  EstadosEmocionaisPage({required this.idTipo});

  @override
  State<EstadosEmocionaisPage> createState() => _EstadosEmocionaisPageState();
}

class _EstadosEmocionaisPageState extends State<EstadosEmocionaisPage> {
  String _dataAtual = DateFormat('dd/MM/yyyy').format(DateTime.now());
  List _selecteItem = [];
  List<RegistroDoDiaModel> selecionados = [];

  Future<List<EstadosEmocionaisModel>> _buscar(int idTipo) async {
    return EstadosEmocionaisDAO().find(idTipo);
  }

  Future<List<int>> _buscarRegistro(String dataNow) async {
    List<int> _idEstadosRegistrados = [];

    selecionados = await RegistroDiarioDAO().find(dataNow);

    for (int i = 0; i < selecionados.length; i++) {
      _onEstadoSelected(true, selecionados[i].idEstadoEmocional);
    }
    print(_idEstadosRegistrados);
    return _idEstadosRegistrados;
  }

  _removerRegistro(int id) async {
    for (int i = 0; i < selecionados.length; i++) {
      await RegistroDiarioDAO().remover(selecionados[i].id);
      selecionados.remove(selecionados[i].id);
    }
  }

  _removerEstado(int id) async {
    return EstadosEmocionaisDAO().remover(id);
  }

  void _onEstadoSelected(bool selected, idEstado) {
    if (selected == true) {
      setState(() {
        _selecteItem.add(idEstado);
      });
    } else {
      setState(() {
        _removerRegistro(idEstado);
        _selecteItem.remove(idEstado);
      });
    }
  }

  @override
  void initState() {
    _buscarRegistro(_dataAtual);
    super.initState();
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
                    'O que você deseja registrar hoje?',
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
                          for (int i = 0; i < _selecteItem.length; i++) {
                            RegistroDiarioDAO()
                                .inserir(1, _selecteItem[i], _dataAtual);
                          }
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
