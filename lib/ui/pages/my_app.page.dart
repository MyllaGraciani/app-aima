import 'package:aima/themes/light.theme.dart';
import 'package:aima/ui/pages/introducao/intro.page.dart';
import 'package:flutter/material.dart';

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
      home: IntroPage(),
    );
  }
}
