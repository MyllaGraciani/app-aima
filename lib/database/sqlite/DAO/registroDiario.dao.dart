import 'package:aima/domain/entities/registro_dia.model.dart';
import 'package:sqflite/sqflite.dart';

import '../conexao.dart';

class RegistroDiarioDAO {
  late Database _db;

  Future<List<RegistroDoDiaModel>> find(String data) async {
    _db = (await Connection.instance.get())!;

    List<Map<String, dynamic>> resultado =
        await _db.query('registroDoDia', where: 'data = ?', whereArgs: [data]);

    List<RegistroDoDiaModel> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return RegistroDoDiaModel(linha['id'], linha['idCiclo'],
          linha['idEstadoEmocional'], linha['data']);
    });

    return lista;
  }

  Future<List<RegistroDiarioModel>> selectRegistroDiario(String data) async {
    _db = (await Connection.instance.get())!;

    List<Map<String, dynamic>> resultado = await _db
        .query('registro_all', where: 'dataRegistro = ?', whereArgs: [data]);

    List<RegistroDiarioModel> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return RegistroDiarioModel(linha['dataRegistro'], linha['ciclo'],
          linha['tipoAnotacao'], linha['estados']);
    });

    return lista;
  }

  inserir(int idCiclo, int idEstadoEmocional, String data) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'registroDoDia';

    Map<String, dynamic> row = {
      "idCiclo": idCiclo,
      "idEstadoEmocional": idEstadoEmocional,
      "data": data
    };
    dynamic ifExist;
    ifExist = (await _db.query('registroDoDia',
        where:
            'EXISTS (SELECT 1 FROM registroDoDia WHERE idEstadoEmocional = ?)',
        whereArgs: [idEstadoEmocional]));

    if (ifExist.toString() == "[]") {
      await _db.insert(tableName, row);
    }
  }

  remover(int id) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'registroDoDia';

    await _db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
