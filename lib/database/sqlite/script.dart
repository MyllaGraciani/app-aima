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
''',
  '''
INSERT INTO CICLO (id, dataInicio, dataInicioPM, dataFimPM ,dataInicioPF, dataFimPF, status) 
VALUES (
     01, 
    '19/05/2021', 
    '19/05/2021', 
    '03/06/2021', 
    '23/05/2021', 
    '14/06/2021',
    'encerraddo'
)
''',
  '''
INSERT INTO registroDoDia(id, idCiclo, idEstadoEmocional, data) 
VALUES (1, 01, 9 , '19/05/2021')
''',
  '''
INSERT INTO registroDoDia(id, idCiclo, idEstadoEmocional, data) 
VALUES (2, 01, 10 , '19/05/2021')
'''
];
