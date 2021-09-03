class UsuarioModel {
  final int id;
  final String nome;
  final String senha;
  final int duracaoCiclo;
  final dynamic tokenUser;
  final int duracaoMenstruacao;

  UsuarioModel(this.id, this.nome, this.duracaoCiclo, this.tokenUser,
      this.duracaoMenstruacao, this.senha);
}
