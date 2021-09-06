import 'package:aima/domain/entities/ciclo.model.dart';
import 'package:sqflite/sqflite.dart';

import '../conexao.dart';

class CicloDAO {
  late Database _db;

  Future<List<CicloModel>> find() async {
    _db = (await Connection.instance.get())!;

    List<Map<String, dynamic>> resultado = await _db.query('ciclo');

    List<CicloModel> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return CicloModel(
        linha['id'],
        linha['idUser'],
        linha['dataInicio'],
        linha['dataInicioPM'],
        linha['dataFimPM'],
        linha['dataInicioPF'],
        linha['dataFimPF'],
        linha['status'],
      );
    });

    return lista;
  }

  inserir(int idUser, int dataInicio, int dataInicioPM, int dataFimPM,
      int dataInicioPF, int dataFimPF, String status) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'ciclo';

    Map<String, dynamic> row = {
      "idUser": idUser,
      "dataInicio": dataInicio,
      "dataInicioPM": dataInicioPM,
      "dataFimPM": dataFimPM,
      "dataInicioPF": dataInicioPF,
      "dataFimPF": dataFimPF,
      "status": status
    };

    await _db.insert(tableName, row);
  }

  remover(int id) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'ciclo';

    await _db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
