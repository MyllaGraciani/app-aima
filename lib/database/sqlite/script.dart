final listCommandCreateInsert = [
  // sintomas
  '''
  CREATE TABLE sintomas(
    id INTEGER PRIMARY KEY
    ,nome VARCHAR(150) NOT NULL
    ,ativo BOOLEAN NOT NULL
  )
''',
  '''
INSERT INTO sintomas (nome, ativo)
VALUES ('Dor de cabeça', 0)
''',
  '''
INSERT INTO sintomas (nome, ativo)
VALUES ('Enxaqueca', 0)
''',
  '''
INSERT INTO sintomas (nome, ativo)
VALUES ('Cólica menstrual', 0)
''',
  '''
INSERT INTO sintomas (nome, ativo)
VALUES ('Cansaço', 0)
''',
  '''
INSERT INTO sintomas (nome, ativo)
VALUES ('Sonolência', 0)
''',
  '''
INSERT INTO sintomas (nome, ativo)
VALUES ('Tontura', 0)
''',
  '''
INSERT INTO sintomas (nome, ativo)
VALUES ('Azia', 0)
''',
  '''
INSERT INTO sintomas (nome, ativo)
VALUES ('Constipação', 0)
''',
  '''
INSERT INTO sintomas (nome, ativo)
VALUES ('Inchaço', 0)
''',
  '''
INSERT INTO sintomas (nome, ativo)
VALUES ('Diarréia', 0)
''',
  '''
INSERT INTO sintomas (nome, ativo)
VALUES ('Teste', 1)
''',
// fim sintomas
// humores
  '''
  CREATE TABLE humores(
    id INT PRIMARY KEY
    ,nome VARCHAR(150) NOT NULL
    ,ativo BOOLEAN NOT NULL
  )
''',
  '''
INSERT INTO humores (nome, ativo)
VALUES ('Feliz', 0)
''',
  '''
INSERT INTO humores (nome, ativo)
VALUES ('Triste', 0)
''',
  '''
INSERT INTO humores (nome, ativo)
VALUES ('Satisfeita', 0)
''',
  '''
INSERT INTO humores (nome, ativo)
VALUES ('Insatisfeita', 0)
''',
  '''
INSERT INTO humores (nome, ativo)
VALUES ('TPM', 0)
''',
  '''
INSERT INTO humores (nome, ativo)
VALUES ('Sensível', 0)
''',
  '''
INSERT INTO humores (nome, ativo)
VALUES ('Irritada', 0)
''',
  '''
INSERT INTO humores (nome, ativo)
VALUES ('Estressada', 0)
''',
  '''
INSERT INTO humores (nome, ativo)
VALUES ('Ansiosa', 0)
''',
  '''
INSERT INTO humores (nome, ativo)
VALUES ('Sem energia', 0)
''',
//  fim humores
];
