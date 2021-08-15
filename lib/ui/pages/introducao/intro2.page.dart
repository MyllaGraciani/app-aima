import 'package:aima/config/app.assets.dart';
import 'package:aima/ui/pages/cadastro/cadastro.nome.page.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IntroducaoPage extends StatefulWidget {
  @override
  State<IntroducaoPage> createState() => _IntroducaoPageState();
}

class _IntroducaoPageState extends State<IntroducaoPage> {
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
                      height: 300,
                      child: Image.asset(
                        AppAssets.iconeWelcome,
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastroNomePage(),
                    ),
                  );
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
