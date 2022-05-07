class Configuracoes {
  static int introLida = 0;
  static String nomeUser = '';
  static String tokenUser = "";
  static int duracaoCiclo = 30;
  static int duracaoMenstruacao = 5;

  // get dataAtual => DateFormat('dd/MM/yyyy').format(DateTime.now());
  // get dataAtual => '17/03/2022';

  // set dataAtual(data) => dataAtual = data;
}

class CicloDia {
  late String _dia;

  CicloDia(this._dia);

  get dia => _dia;

  set dia(dataAtual) => _dia = dataAtual;
}
