import 'package:aima/config/light.theme.dart';
import 'package:aima/ui/pages/cadastro/cadastro.email.page.dart';
import 'package:aima/ui/pages/cadastro/cadastro.genero.page.dart';
import 'package:aima/ui/pages/cadastro/cadastro.nome.page.dart';
import 'package:aima/ui/pages/calendario/calendario.page.dart';
import 'package:aima/ui/pages/embreve/embreve.page.dart';
import 'package:aima/ui/pages/erro/error.page.dart';
import 'package:aima/ui/pages/perfil/perfil.page.dart';
import 'package:flutter/material.dart';

import 'cadastro/cadastro-ciclo/duracao.menstrual.page.dart';
import 'cadastro/cadastro-ciclo/duracao.page.dart';
import 'cadastro/cadastro.senha.page.dart';
import 'notas/notas.page.dart';
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
        '/anotacoes': (context) => NotasPage(),
        '/calendario': (context) => CalendarioPage(),
        '/em_breve': (context) => EmBrevePage(),
        '/erro': (context) => ErrorPage(),
        '/carregar_page': (context) => CarregarPage(),

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
