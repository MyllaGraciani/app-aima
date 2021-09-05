class CadastroValidator {
  static CadastroValidator instance = CadastroValidator();
  final verificaSeEspaco = RegExp(".*\\S.*");

  bool nomeValido(value) {
    if (value == null ||
        value.isEmpty ||
        verificaSeEspaco.hasMatch(value) == false) {
      return false;
    }
    return true;
  }

  bool cicloValido(value) {
    if (value == null ||
        value.isEmpty ||
        verificaSeEspaco.hasMatch(value) == false ||
        int.parse(value) <= 20) {
      return false;
    }
    return true;
  }

  bool pnValido(value) {
    if (value == null ||
        value.isEmpty ||
        verificaSeEspaco.hasMatch(value) == false ||
        int.parse(value) > 12 ||
        int.parse(value) <= 0) {
      return false;
    }
    return true;
  }

  bool senhaValida(value) {
    if (value == null ||
        value.isEmpty ||
        verificaSeEspaco.hasMatch(value) == false ||
        value.toString().length > 4 ||
        value.toString().length < 8) {
      return false;
    }
    return true;
  }
}
