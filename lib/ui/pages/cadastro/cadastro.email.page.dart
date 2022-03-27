import 'package:aima/ui/pages/cadastro/cadastro.senha.page.dart';
import 'package:aima/ui/pages/cadastro/widget/cadastro.widget.dart';
import 'package:flutter/material.dart';

class CadastroEmailPage extends StatefulWidget {
  @override
  _CadastroEmailPageState createState() => _CadastroEmailPageState();
}

class _CadastroEmailPageState extends State<CadastroEmailPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LinearProgressIndicator(
              //   value: 0.3,
              //   valueColor: AlwaysStoppedAnimation<Color>(
              //       Theme.of(context).primaryColor),
              // ),
              Form(
                key: _formKey,
                child: CadastroWidget(
                  label: "Qual é o seu e-mail:",
                  labelInput: "E-mail",
                  proxTela: CadastroSenhaPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
