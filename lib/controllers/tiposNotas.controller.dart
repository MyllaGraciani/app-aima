import 'package:aima/database/sqlite/DAO/tiposNotas.dao.dart';
import 'package:aima/domain/entities/tipo_notas.model.dart';

class TiposNotasController {
  Future<List<TipoNotasModel>> buscarTiposNotas() async {
    return TipoNotasDAO().find();
  }
}
