import 'dart:async';
import 'package:aima/config/app.assets.dart';
import 'package:aima/database/sqlite/conexao.dart';
import 'package:aima/ui/pages/introducao/intro2.page.dart';
import 'package:aima/ui/pages/tabs-menu/tabs.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarregarPage extends StatefulWidget {
  @override
  _CarregarPageState createState() => _CarregarPageState();
}

class _CarregarPageState extends State<CarregarPage> {
  final dbConnect = Connection.instance;

  Future<int> getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await dbConnect.get();

    int? introRead = prefs.getInt('introLida');

    if (introRead == null) {
      return 0;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Container(
      child: FutureBuilder(
        future: getPreferences(),
        initialData: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.logo,
              ),
            ],
          ),
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data == 0) {
              return IntroducaoPage();
            } else {
              return TabsPage();
            }
          }
        },
      ),
    );
  }
}
