class CicloModel {
  final int id;
  final int idUser;
  final DateTime dataInicio;
  final DateTime dataInicioPM;
  final DateTime dataFimPM;
  final DateTime dataInicioPF;
  final DateTime dataFimPF;
  final String status;

  CicloModel(this.id, this.idUser, this.dataInicio, this.dataInicioPM,
      this.dataFimPM, this.dataInicioPF, this.dataFimPF, this.status);
}
