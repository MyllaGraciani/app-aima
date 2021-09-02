import 'package:aima/domain/entities/estados_emo.model.dart';
import 'package:sqflite/sqflite.dart';

import '../conexao.dart';

class SintomaDAO {
  late Database _db;

  Future<List<EstadosEmocionaisModel>> find() async {
    _db = (await Connection.instance.get())!;

    List<Map<String, dynamic>> resultado = await _db
        .query('estadosEmocionais', where: 'idTipo = ?', whereArgs: [4]);

    List<EstadosEmocionaisModel> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return EstadosEmocionaisModel(
          linha['id'], linha['descricao'], linha['idTipo']);
    });

    return lista;
  }
}
