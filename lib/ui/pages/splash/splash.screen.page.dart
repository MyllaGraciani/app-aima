import 'dart:async';

import 'package:aima/ui/pages/splash/splash.load.page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigationToNextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CarregarPage()),
    );
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
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
              height: 300,
              child: Image.asset(
                "assets/logo.png",
              ),
            ),
            Text(
              "aíma",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
