import 'dart:async';

import 'package:aima/config/app.size.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToNextPage() {
    Navigator.of(context).pushReplacementNamed('/carregar_page');
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 10);
    await Firebase.initializeApp();
    return new Timer(_duration, navigateToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.of(context).dynamicScaleSize(size: 300),
              child: Image.asset(
                "assets/logo.png", //TODOdiminuir o peso da imagem
              ),
            ),
            Text(
              "aíma",
              style: Theme.of(context).textTheme.headline4,
              //TODOver se vale criar os estilos em um arq separado ou não
            ),
          ],
        ),
      ),
    );
  }
}
