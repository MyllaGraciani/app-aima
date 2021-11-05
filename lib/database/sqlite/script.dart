final String createTable1 = '''
  CREATE TABLE IF NOT EXISTS tiposAnotacoes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao VARCHAR(150) NOT NULL
  )
''';
final String createTable2 = '''
  CREATE TABLE IF NOT EXISTS estadosEmocionais(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idTipo INT NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    FOREIGN KEY(idTipo) REFERENCES tiposAnotacoes(id)
  )
''';
final String createTable3 = '''
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
final String createTable4 = '''
  CREATE TABLE IF NOT EXISTS registroDoDia(
    id INTEGER PRIMARY KEY,
    idCiclo INT NOT NULL,
    idEstadoEmocional INT NOT NULL,
    data VARCHAR(10) NOT NULL,
    FOREIGN KEY(idCiclo) REFERENCES ciclo(id),
    FOREIGN KEY(idEstadoEmocional) REFERENCES estadosEmocionais(id)
  )
''';

final String createView1 =
    '''CREATE VIEW registro_all (dataRegistro, ciclo, tipoAnotacao, estados)
AS SELECT d.data, d.idCiclo, t.descricao, e.descricao
FROM registroDoDia d INNER JOIN estadosEmocionais e ON d.idEstadoEmocional = e.id  INNER JOIN tiposAnotacoes t ON e.idTipo = t.id
ORDER BY d.idCiclo ;''';

final List<String> listInsert = [
  '''
INSERT INTO tiposAnotacoes (id, descricao)
VALUES (1,'Sintomas')
''',
  '''
INSERT INTO tiposAnotacoes (id, descricao)
VALUES (2,'Humores')
''',
  '''
INSERT INTO tiposAnotacoes (id, descricao)
VALUES (3,'Sexo')
''',
  '''
INSERT INTO tiposAnotacoes (id, descricao)
VALUES (4,'Muco')
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (1,'Feliz', 2)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (2,'Triste', 2)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (3,'Satisfeita', 2)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (4,'Insatisfeita', 2)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (5,'TPM', 2)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (6,'Sensível', 2)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (7,'Irritada', 2)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (8,'Estressada', 2)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (9,'Ansiosa', 2)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (10,'Sem energia', 1)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (11,'Dor de cabeça', 1)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (12,'Enxaqueca', 1)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (13,'Cólica menstrual', 1)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (14,'Cansaço', 1)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (15,'Sonolência', 1)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (16,'Tontura', 1)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (17,'Azia', 1)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (18,'Constipação', 1)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (19,'Inchaço', 1)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (20,'Diarréia', 1)
'''
];
