import 'package:aima/database/db_util.dart';
import 'package:flutter/material.dart';

class TesteDB extends StatelessWidget {
  // referencia nossa classe single para gerenciar o banco de dados
  final dbHelper = DatabaseHelper.instance;
  // final dbConnect = Connection.instance;
  // layout da homepage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de CRUD básico'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text(
                'Inserir dados',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _inserir();
              },
            ),
            ElevatedButton(
              child: Text(
                'Consultar dados',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _consultar();
              },
            ),
            ElevatedButton(
              child: Text(
                'Consultar dados sintomas',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                // _consultar2();
              },
            ),
            ElevatedButton(
              child: Text(
                'Atualizar dados',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _atualizar();
              },
            ),
            ElevatedButton(
              child: Text(
                'Deletar dados',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _deletar();
              },
            ),
          ],
        ),
      ),
    );
  }

  // métodos dos Buttons
  void _inserir() async {
    // linha para incluir
    Map<String, dynamic> row = {
      DatabaseHelper.columnNome: 'Dor de cabeça',
      DatabaseHelper.columnAtivo: 0
    };
    final id = await dbHelper.insert(row);
    print('linha inserida id: $id');
  }

  void _consultar() async {
    final todasLinhas = await dbHelper.queryAllRows();
    print('Consulta todas as linhas:');
    todasLinhas.forEach((row) => print(row));
  }

  // void _consultar2() async {
  //   final todasLinhas = await dbConnect.queryAllRows();
  //   print('Consulta todas as linhas:');
  //   todasLinhas.forEach((row) => print(row));
  // }

  void _atualizar() async {
    // linha para atualizar
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnNome: 'Dor',
      DatabaseHelper.columnAtivo: 1
    };
    final linhasAfetadas = await dbHelper.update(row);
    print('atualizadas $linhasAfetadas linha(s)');
  }

  void _deletar() async {
    // Assumindo que o numero de linhas é o id para a última linha
    final id = await dbHelper.queryRowCount();
    final linhaDeletada = await dbHelper.delete(id!);
    print('Deletada(s) $linhaDeletada linha(s): linha $id');
  }
}
