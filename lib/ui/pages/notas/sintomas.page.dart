import 'package:aima/database/sqlite/DAO/sintoma.dao.dart';
import 'package:aima/domain/entities/estados_emo.model.dart';
import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:flutter/material.dart';

class SintomasPage extends StatefulWidget {
  @override
  State<SintomasPage> createState() => _SintomasPageState();
}

class _SintomasPageState extends State<SintomasPage> {
  Future<List<EstadosEmocionaisModel>> _buscar() async {
    return SintomaDAO().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EstadosEmocionaisModel>>(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<EstadosEmocionaisModel>? lista = futuro.data;
            return Scaffold(
                appBar: AppBarWidget(
                  label: 'Sintomas',
                  textStyleSub: Theme.of(context).textTheme.subtitle1,
                ),
                body: ListView.builder(
                  itemCount: lista!.length,
                  itemBuilder: (context, i) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      selected: false,
                      value: false,
                      title: Text(lista[i].descricao),
                      onChanged: (value) {
                        // setState(() {
                        //   _boolCheck = !_boolCheck;
                        // });
                      },
                    );
                  },
                ));
          } else {
            return Scaffold();
          }
        });
  }
}
