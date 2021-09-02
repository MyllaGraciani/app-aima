// import 'periodo.model.dart';

import 'package:aima/models/dia.model.dart';

class CicloModel {
  final DateTime _inicioCiclo;
  // final DateTime _fimCiclo;

  List<DiaModel> dias = [];

  CicloModel(this._inicioCiclo);

  // addDia(DiaModel) {
  //   dias.add(DiaModel);
  // }

  get getInicioCiclo {
    return this._inicioCiclo;
  }
}
