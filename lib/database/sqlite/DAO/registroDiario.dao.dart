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

      return RegistroDoDiaModel(
          linha['id'], linha['idCiclo'], linha['idEstadoEmo'], linha['data']);
    });

    return lista;
  }

  inserir(int idUser, int idCiclo, int idEstadoEmo, int data) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'registroDoDia';

    Map<String, dynamic> row = {
      "idCiclo": idCiclo,
      "idEstadoEmo": idEstadoEmo,
      "data": data
    };

    await _db.insert(tableName, row);
  }

  remover(int id) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'registroDoDia';

    await _db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
