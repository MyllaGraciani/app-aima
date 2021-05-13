import 'package:aima/themes/light.theme.dart';
import 'package:aima/ui/android/pages/login.page.dart';

import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_) => runApp(App()));
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aíma',
      theme: lightTheme(),
      home: LoginPage(),
    );
  }
}
