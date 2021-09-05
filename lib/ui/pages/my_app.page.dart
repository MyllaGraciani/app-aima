import 'package:aima/config/light.theme.dart';
import 'package:aima/ui/pages/cadastro/cadastro.nome.page.dart';
import 'package:flutter/material.dart';

import 'splash/splash.screen.page.dart';

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
      //  home: TesteDB(),
      // home: SplashScreen(),
      home: CadastroNomePage(),
    );
  }
}
