import 'package:aima/config/app.assets.dart';
import 'package:aima/config/app.color.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const kIcons = <Icon>[
    Icon(Icons.event),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.alarm),
    Icon(Icons.face),
    Icon(Icons.language),
  ];

  static final introPages = <Widget>[
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.iconeWelcome),
          Text(
            "Olá, eu sou aíma, o aplicativo que irá te ajudar a acompanhar o seu ciclo menstrual, sintomas e humores :)",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Lato',
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w300,
              fontSize: 23,
            ),
          ),
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.iconeWelcome),
          Text(
            "Olá, eu sou aíma, o aplicativo que irá te ajudar a acompanhar o seu ciclo menstrual, sintomas e humores :)",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Lato',
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w300,
              fontSize: 23,
            ),
          ),
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.iconeWelcome),
          Text(
            "Aqui, todos os seus dados pessoais pertence somente a você. As únicas informações que usamos são as informações necessárias para melhorar a previsçao do próximo ciclo, humores e sintomas feitos de maneira totalmente anônima.",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Lato',
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w300,
              fontSize: 23,
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: introPages.length,
        child: Builder(
          builder: (BuildContext context) => Container(
            color: AppColors.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  const TabPageSelector(),
                  Expanded(
                    child: TabBarView(children: introPages),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('CONTINUAR'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
