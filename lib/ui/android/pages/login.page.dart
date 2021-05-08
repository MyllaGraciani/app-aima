import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:aima/ui/shared/widgets/input.widget.dart';
import 'package:flutter/material.dart';

import 'tabs.page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(
                  "assets/logo.png",
                ),
              ),
              Text(
                "aíma",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 10,
              ),
              InputWidget(
                label: "E-mail",
                typeKeyboard: TextInputType.emailAddress,
                obscure: false,
              ),
              SizedBox(
                height: 10,
              ),
              InputWidget(
                label: "Senha",
                typeKeyboard: TextInputType.text,
                obscure: true,
              ),
              SizedBox(
                height: 20,
              ),
              ButtonWidgetGeneric(
                typeButton: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TabsPage(),
                      ),
                    );
                  },
                  child: Text("Entrar"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ButtonWidgetGeneric(
                typeButton: TextButton(
                  onPressed: () {},
                  child: Text("Cadastrar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
