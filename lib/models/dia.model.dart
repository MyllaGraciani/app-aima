import 'package:shared_preferences/shared_preferences.dart';

class DiaModel {
  final DateTime data;
  final bool dataInicioCiclo;
  final bool dataFimCiclo;

  DiaModel(this.data, this.dataInicioCiclo, this.dataFimCiclo);

  Future<int?> getDuracaoCiclo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? duracaoCiclo = prefs.getInt('duracaoCiclo');
    print(duracaoCiclo);
    return duracaoCiclo;
  }

  iniciarCiclo(dataInicioCiclo) {
    if (dataInicioCiclo == true) {
      // CicloModel ciclo = CicloModel(data);
    }
  }
}
