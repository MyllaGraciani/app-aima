import 'package:aima/themes/light.theme.dart';
import 'package:aima/ui/pages/embreve/embreve.page.dart';
import 'package:aima/ui/pages/login/login.page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget? caminho;

  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('introLida', 0);
    int? introRead = prefs.getInt('introLida');
    if (introRead != null) {
      if (introRead == 0) {
        caminho = LoginPage();
        prefs.setInt('introLida', 1);
      } else {
        caminho = EmBrevePage();
      }
    } else {
      print("ferrou");
    }
  }

  @override
  void initState() {
    getValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aíma',
      theme: lightTheme(),
      home: caminho,
    );
  }
}
//appCadastro == true ? LoginPage() : EmBrevePage()