import 'package:aima/database/sqlite/DAO/estadosEmo.dao.dart';

class EstadosEmoController {
  Future<void> addEstadoEmocional(String descricao, int id) async {
    EstadosEmocionaisDAO().inserir(descricao, id);
  }
}
