import 'package:aima/config/light.theme.dart';
import 'package:aima/ui/pages/cadastro/cadastro.email.page.dart';
import 'package:aima/ui/pages/cadastro/cadastro.genero.page.dart';
import 'package:aima/ui/pages/cadastro/cadastro.nome.page.dart';
import 'package:aima/ui/pages/calendario/calendario.page.dart';
import 'package:aima/ui/pages/embreve/embreve.page.dart';
import 'package:aima/ui/pages/erro/error.page.dart';
import 'package:aima/ui/pages/home/selecionarData.dart';
import 'package:aima/ui/pages/login/login.page.dart';
import 'package:aima/ui/pages/notas/addCategoria.page.dart';
import 'package:aima/ui/pages/notas/addForm.page.dart';
import 'package:aima/ui/pages/notas/estadosEmo.page.dart';
import 'package:aima/ui/pages/notas/notes.page.dart';
import 'package:aima/ui/pages/perfil/perfil.page.dart';
import 'package:flutter/material.dart';

import 'cadastro/cadastro-ciclo/duracao.menstrual.page.dart';
import 'cadastro/cadastro-ciclo/duracao.page.dart';
import 'cadastro/cadastro.senha.page.dart';
import 'splash/splash.load.page.dart';
import 'splash/splash.screen.page.dart';
import 'tabs-menu/tabs.page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aíma',
      theme: lightTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => TabsPage(),
        '/perfil': (context) => PerfilPage(),
        '/anotacoes': (context) => NotesPage(),
        '/anotar_sintomas': (context) => EstadosEmocionaisPage(idTipo: 1),
        '/anotar_humores': (context) => EstadosEmocionaisPage(idTipo: 2),
        '/anotar_sexo': (context) => EstadosEmocionaisPage(idTipo: 3),
        '/anotar_muco': (context) => EstadosEmocionaisPage(idTipo: 4),
        '/anotar_alimentacao': (context) => EstadosEmocionaisPage(idTipo: 5),
        '/anotar_higiene': (context) => EstadosEmocionaisPage(idTipo: 6),
        '/add_estado_emocional': (context) => AddFormPage(),
        '/add_categoria': (context) => AddCategoriaPage(),
        '/calendario': (context) => CalendarioPage(),
        '/em_breve': (context) => EmBrevePage(),
        '/erro': (context) => ErrorPage(),
        '/carregar_page': (context) => CarregarPage(),
        '/login': (context) => LoginPage(),
        '/selecionar_data': (context) => SelecionarDataPage(),

        // pages cadastro
        '/cadastro_email': (context) => CadastroEmailPage(),
        '/cadastro_genero': (context) => CadastroGeneroPage(),
        '/cadastro_nome': (context) => CadastroNomePage(),
        '/cadastro_senha': (context) => CadastroSenhaPage(),

        '/cadastro_duracao_ciclo': (context) => DuracaoCicloPage(),
        '/cadastro_duracao_menstruacao': (context) => DuracaoMenstrualPage(),
      },
    );
  }
}
