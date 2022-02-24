final String createTableTiposAnotacoes = '''
  CREATE TABLE IF NOT EXISTS tiposAnotacoes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao VARCHAR(150) NOT NULL
  )
''';
final String createTableEstadosEmocionais = '''
  CREATE TABLE IF NOT EXISTS estadosEmocionais(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idTipo INT NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    FOREIGN KEY(idTipo) REFERENCES tiposAnotacoes(id)
  )
''';
final String createTableCiclo = '''
  CREATE TABLE IF NOT EXISTS ciclo(
    id INTEGER PRIMARY KEY,
    dataInicio VARCHAR(10) NOT NULL,
    dataInicioPM VARCHAR(10) NOT NULL,
    dataFimPM VARCHAR(10),
    dataInicioPF VARCHAR(10),
    dataFimPF VARCHAR(10),
    status VARCHAR(50)
  )
''';
final String createTableRegistroDoDia = '''
  CREATE TABLE IF NOT EXISTS registroDoDia(
    id INTEGER PRIMARY KEY,
    idCiclo INT NOT NULL,
    idEstadoEmocional INT NOT NULL,
    data VARCHAR(10) NOT NULL,
    FOREIGN KEY(idCiclo) REFERENCES ciclo(id),
    FOREIGN KEY(idEstadoEmocional) REFERENCES estadosEmocionais(id)
  )
''';

final String createViewRregistroAll =
    '''CREATE VIEW registro_all (dataRegistro, ciclo, tipoAnotacao, estados)
AS SELECT DISTINCT d.data, d.idCiclo, t.descricao, e.descricao 
FROM registroDoDia d INNER JOIN estadosEmocionais e ON d.idEstadoEmocional = e.id  INNER JOIN tiposAnotacoes t ON e.idTipo = t.id
ORDER BY e.idTipo;''';
