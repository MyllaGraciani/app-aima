import 'package:aima/database/sqlite/DAO/humores.dao.dart';
import 'package:aima/domain/entities/estados_emo.model.dart';
import 'package:aima/ui/pages/notas/addForm.page.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class HumoresPage extends StatefulWidget {
  @override
  State<HumoresPage> createState() => _HumoresPageState();
}

class _HumoresPageState extends State<HumoresPage> {
  Future<List<EstadosEmocionaisModel>> _buscar() async {
    return HumoresDAO().find();
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
                      Navigator.push(
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
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            dense: true,
                            contentPadding: EdgeInsets.all(5),
                            selected: false,
                            value: false,
                            title: Text(
                              lista[i].descricao,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            onChanged: (value) {
                              // setState(() {
                              //   _boolCheck = !_boolCheck;
                              // });
                            },
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
