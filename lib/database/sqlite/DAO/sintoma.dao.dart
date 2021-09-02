import 'package:aima/domain/entities/sintoma.model.dart';
import 'package:sqflite/sqflite.dart';

import '../conexao.dart';

class SintomaDAO {
  late Database _db;

  Future<List<SintomasModel>> find() async {
    _db = (await Connection.instance.get())!;

    List<Map<String, dynamic>> resultado = await _db.query('sintomas');

    List<SintomasModel> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return SintomasModel(linha['id'], linha['nome'], linha['ativo']);
    });

    return lista;
  }
}
