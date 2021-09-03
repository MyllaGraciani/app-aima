import 'package:aima/domain/entities/tipo_notas.model.dart';
import 'package:sqflite/sqflite.dart';

import '../conexao.dart';

class TipoNotasDAO {
  late Database _db;

  Future<List<TipoNotasModel>> find() async {
    _db = (await Connection.instance.get())!;

    List<Map<String, dynamic>> resultado = await _db.query('tiposAnotacoes');

    List<TipoNotasModel> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return TipoNotasModel(linha['id'], linha['descricao']);
    });

    return lista;
  }

  inserir(String desc, int idTipo) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'estadosEmocionais';

    Map<String, dynamic> row = {"descricao": desc, "idTipo": idTipo};

    await _db.insert(tableName, row);
  }

  remover(int id) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'estadosEmocionais';

    await _db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
