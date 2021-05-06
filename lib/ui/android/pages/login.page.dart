import 'package:aima/ui/android/widgets/input.widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
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
                height: 20,
              ),
              InputWidget(
                label: "E-mail",
                typeKeyboard: TextInputType.emailAddress,
                obscure: false,
              ),
              SizedBox(
                height: 20,
              ),
              InputWidget(
                label: "Senha",
                typeKeyboard: TextInputType.text,
                obscure: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
