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
    idUser INT NOT NULL,
    dataInicio INT NOT NULL,
    dataInicioPM INT NOT NULL,
    dataFimPM INT,
    dataInicioPF INT,
    dataFimPF INT
  )
''';
final String createTable4 = '''
  CREATE TABLE IF NOT EXISTS registroDoDia(
    id INTEGER PRIMARY KEY,
    idUsuario INT NOT NULL,
    idCiclo INT NOT NULL,
    idEstadoEmocional INT NOT NULL,
    data INT NOT NULL,
    FOREIGN KEY(idCiclo) REFERENCES ciclo(id),
    FOREIGN KEY(idEstadoEmocional) REFERENCES estadosEmocionais(id)
  )
''';

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
VALUES (1,'Feliz', 3)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (2,'Triste', 3)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (3,'Satisfeita', 3)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (4,'Insatisfeita', 3)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (5,'TPM', 3)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (6,'Sensível', 3)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (7,'Irritada', 3)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (8,'Estressada', 3)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (9,'Ansiosa', 3)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (10,'Sem energia', 4)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (11,'Dor de cabeça', 4)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (12,'Enxaqueca', 4)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (13,'Cólica menstrual', 4)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (14,'Cansaço', 4)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (15,'Sonolência', 4)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (16,'Tontura', 4)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (17,'Azia', 4)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (18,'Constipação', 4)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (19,'Inchaço', 4)
''',
  '''
INSERT INTO estadosEmocionais (id, descricao, idTipo)
VALUES (20,'Diarréia', 4)
'''
];
