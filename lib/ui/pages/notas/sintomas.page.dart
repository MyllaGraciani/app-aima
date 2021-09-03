import 'package:aima/database/sqlite/DAO/sintoma.dao.dart';
import 'package:aima/domain/entities/estados_emo.model.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

import 'addForm.page.dart';

class SintomasPage extends StatefulWidget {
  @override
  State<SintomasPage> createState() => _SintomasPageState();
}

class _SintomasPageState extends State<SintomasPage> {
  List _selecteSintoma = [];

  Future<List<EstadosEmocionaisModel>> _buscar() async {
    return SintomaDAO().find();
  }

  _removerSintoma(int id) async {
    return SintomaDAO().remover(id);
  }

  void _onSintomaSelected(bool selected, sintomaID) {
    if (selected == true) {
      setState(() {
        _selecteSintoma.add(sintomaID);
      });
    } else {
      setState(() {
        _selecteSintoma.remove(sintomaID);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EstadosEmocionaisModel>>(
        future: _buscar(),
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
                    child: ListView.builder(
                      itemCount: lista!.length,
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
                            value: _selecteSintoma.contains(lista[i].id),
                            controlAffinity: ListTileControlAffinity.leading,
                            selected: _selecteSintoma.contains(lista[i].id),
                            activeColor:
                                Theme.of(context).primaryColor.withAlpha(0),
                            selectedTileColor:
                                Theme.of(context).primaryColor.withAlpha(200),
                            title: Text(
                              lista[i].descricao,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onChanged: (selected) {
                              _onSintomaSelected(selected!, lista[i].id);
                            },
                            secondary: IconButton(
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                _onSintomaSelected(false, lista[i].id);
                                _removerSintoma(lista[i].id);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        );
                      },
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
        });
  }
}
