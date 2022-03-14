import 'package:aima/config/app.assets.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroducaoPage extends StatefulWidget {
  @override
  State<IntroducaoPage> createState() => _IntroducaoPageState();
}

class _IntroducaoPageState extends State<IntroducaoPage> {
  getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('introLida', 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 250,
                      child: Image.asset(
                        AppAssets.iconeWelcome,
                      ),
                    ),
                    Text(
                      "Olá, eu sou aíma, o aplicativo que irá te ajudar a acompanhar o seu ciclo menstrual, sintomas e humores. ",
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            ButtonWidgetGeneric(
              typeButton: ElevatedButton(
                onPressed: () {
                  getPreferences();

                  Navigator.of(context).pushNamed('/cadastro_nome');
                },
                child: Text("Entrar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
