import 'package:aima/domain/entities/estados_emo.model.dart';
import 'package:sqflite/sqflite.dart';

import '../conexao.dart';

class HumoresDAO {
  late Database _db;

  Future<List<EstadosEmocionaisModel>> find() async {
    _db = (await Connection.instance.get())!;

    List<Map<String, dynamic>> resultado = await _db
        .query('estadosEmocionais', where: 'idTipo = ?', whereArgs: [3]);

    List<EstadosEmocionaisModel> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return EstadosEmocionaisModel(
          linha['id'], linha['descricao'], linha['idTipo']);
    });

    return lista;
  }

  inserir(String desc, int idTipo) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'estadosEmocionais';

    Map<String, dynamic> row = {"descricao": desc, "idTipo": idTipo};

    final id = await _db.insert(tableName, row);
    print('linha inserida id: $id');
  }
}
