import 'package:aima/controllers/valueNotifier.dart';
import 'package:aima/database/sqlite/DAO/ciclo.dao.dart';
import 'package:aima/domain/entities/ciclo.model.dart';
import 'package:intl/intl.dart';

class DiaRegistro {
  cicloSelecionado() {
    Future<List<CicloModel>> ciclos;
    ciclos = CicloDAO().findAll();
    ciclos.then((ciclo) {
      ciclo.forEach((element) {
        DateTime inicioCiclo = formatarData(element.dataInicio);
        DateTime fimCiclo;
        DateTime dataSelecionada = formatarData(dataAtual.value);

        if (element.dataFim != 'sem data') {
          fimCiclo = formatarData(element.dataFim);
        } else {
          fimCiclo = inicioCiclo.add(Duration(days: 30));
        }

        if (dataSelecionada.isAfter(inicioCiclo) ||
            dataSelecionada.isAtSameMomentAs(inicioCiclo) &&
                dataSelecionada.isBefore(fimCiclo) ||
            dataSelecionada.isAtSameMomentAs(inicioCiclo)) {
          print("=======> id: " +
              element.id.toString() +
              " data inicio: " +
              element.dataInicio +
              " data fim: " +
              element.dataFim +
              " status: " +
              element.status);
        }
        // print("id: " +
        //     element.id.toString() +
        //     " data inicio: " +
        //     element.dataInicio +
        //     " data fim: " +
        //     element.dataFim +
        //     " status: " +
        //     element.status);
      });
    });
  }

  formatarData(data) {
    if (data is String) {
      return DateFormat('dd/MM/yyyy').parse(data);
    } else {
      return DateFormat('dd/MM/yyyy').format(data);
    }
  }

  String diaCiclo(String dataInicio, {required int idCiclo}) {
    DateTime iniciociclo = formatarData(dataInicio);
    DateTime dAtual = formatarData(dataAtual.value);
    Duration diaCiclo = dAtual.difference(iniciociclo);
    return diaCiclo.inDays.toString();
  }
}
