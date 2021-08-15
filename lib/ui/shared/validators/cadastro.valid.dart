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

  bool emailValido(value) {
    if (value == null ||
        value.isEmpty ||
        verificaSeEspaco.hasMatch(value) == false) {
      return false;
    }
    return true;
  }

  bool senhaValida(value) {
    if (value == null ||
        value.isEmpty ||
        verificaSeEspaco.hasMatch(value) == false) {
      return false;
    }
    return true;
  }
}
