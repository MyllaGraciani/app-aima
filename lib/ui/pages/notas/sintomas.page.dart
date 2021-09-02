import 'package:aima/database/sqlite/DAO/sintoma.DAO.dart';
import 'package:aima/domain/entities/sintoma.model.dart';
import 'package:flutter/material.dart';

class SintomasPage extends StatelessWidget {
  Future<List<SintomasModel>> _buscar() async {
    return SintomaDAO().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SintomasModel>>(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<SintomasModel>? lista = futuro.data;
            return Scaffold(
                appBar: AppBar(
                  title: Text('Lista de sintomas'),
                ),
                body: ListView.builder(
                  itemCount: lista!.length,
                  itemBuilder: (context, i) {
                    var sintoma = lista[i];
                    return ListTile(
                      title: Text(lista[i].nome),
                      subtitle: Text(sintoma.ativo.toString()),
                    );
                  },
                ));
          } else {
            return Scaffold();
          }
        });
  }
}
