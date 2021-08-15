import 'package:aima/models/ciclo.model.dart';

class PeriodoModel {
  final String nome;
  final DateTime inicioPeriodo;
  final DateTime fimPeriodo;
  // CicloModel ciclo = CicloModel();

  PeriodoModel(
      {required this.inicioPeriodo,
      required this.fimPeriodo,
      required this.nome});

  List<PeriodoModel> getCurrencies() {
    return <PeriodoModel>[
      // PeriodoModel(
      // inicioPeriodo: ciclo.inicioCiclo,
      // fimPeriodo: fimPeriodo,
      // nome: "Menstruação")
    ];
  }
}
