import 'package:aima/themes/light.theme.dart';
import 'package:aima/ui/android/pages/login.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      home: LoginPage(),
    );
  }
}
