import 'dart:async';
import 'package:aima/ui/pages/embreve/embreve.page.dart';
import 'package:aima/ui/pages/login/login.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarregarPage extends StatefulWidget {
  @override
  _CarregarPageState createState() => _CarregarPageState();
}

class _CarregarPageState extends State<CarregarPage> {
  Future<int> getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? introRead = prefs.getInt('introLida');

    if (introRead == null) {
      return 0;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

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
                "assets/logo.png",
              ),
            ],
          ),
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Text("carregando.."),
            );
          } else {
            if (snapshot.data == 0) {
              return EmBrevePage();
            } else {
              return LoginPage();
            }
          }
        },
      ),
    );
  }
}
