class RegistroDoDiaModel {
  final int id;
  final int idCiclo;
  final int idEstadoEmocional;
  final String data;

  RegistroDoDiaModel(this.id, this.idCiclo, this.idEstadoEmocional, this.data);
}

class RegistroDiarioModel {
  final String dataRegistro;
  final int ciclo;
  final String tipoAnotacao;
  final String estados;

  RegistroDiarioModel(
      this.dataRegistro, this.ciclo, this.tipoAnotacao, this.estados);
}
