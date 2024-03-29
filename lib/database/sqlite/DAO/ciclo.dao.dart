import 'package:aima/domain/entities/ciclo.model.dart';
import 'package:sqflite/sqflite.dart';

import '../conexao.dart';

class CicloDAO {
  late Database _db;

  Future<List<CicloModel>> findAll() async {
    _db = (await Connection.instance.get())!;

    List<Map<String, dynamic>> resultado = await _db.query('ciclo');

    List<CicloModel> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return CicloModel(
        linha['id'],
        linha['dataInicio'],
        linha['dataFimPM'] == null ? "sem data" : linha['dataFimPM'],
        linha['dataInicioPF'] == null ? "sem data" : linha['dataInicioPF'],
        linha['dataFimPF'] == null ? "sem data" : linha['dataFimPF'],
        linha['dataFim'] == null ? "sem data" : linha['dataFim'],
        linha['status'],
      );
    });
    findIDCicloAtual();
    return lista;
  }

  Future<List<CicloModel>> findCicloAtual() async {
    _db = (await Connection.instance.get())!;

    List<Map<String, dynamic>> resultado =
        await _db.query('ciclo', where: 'status = ?', whereArgs: ["atual"]);

    List<CicloModel> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];

      return CicloModel(
        linha['id'],
        linha['dataInicio'],
        linha['dataFimPM'] == null ? "sem data" : linha['dataFimPM'],
        linha['dataInicioPF'] == null ? "sem data" : linha['dataInicioPF'],
        linha['dataFimPF'] == null ? "sem data" : linha['dataFimPF'],
        linha['dataFim'] == null ? "sem data" : linha['dataFim'],
        linha['status'],
      );
    });
    findIDCicloAtual();
    return lista;
  }

  Future<int> findIDCicloAtual() async {
    _db = (await Connection.instance.get())!;

    bool isEmpty = await _db.rawQuery('SELECT * FROM ciclo WHERE status = ?',
        ['atual']).then((value) => value.isEmpty);

    if (isEmpty) {
      return 0;
    }
    List<Map<String, dynamic>> resultado =
        await _db.query('ciclo', where: 'status = ?', whereArgs: ["atual"]);
    return resultado[0].values.first;
  }

  iniciarCiclo(String dataInicio, String status) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'ciclo';

    Map<String, dynamic> row = {"dataInicio": dataInicio, "status": status};

    await _db.insert(tableName, row);
  }

  atualizarCiclo(Map<String, dynamic> row) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'ciclo';

    await _db.update(tableName, row);
  }

  remover(int id) async {
    _db = (await Connection.instance.get())!;

    String tableName = 'ciclo';

    await _db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
