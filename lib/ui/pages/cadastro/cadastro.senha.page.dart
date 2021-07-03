import 'package:aima/ui/pages/cadastro/cadastro.genero.page.dart';
import 'package:aima/ui/pages/cadastro/widget/cadastro.widget.dart';
import 'package:flutter/material.dart';

class CadastroSenhaPage extends StatefulWidget {
  @override
  _CadastroSenhaPageState createState() => _CadastroSenhaPageState();
}

class _CadastroSenhaPageState extends State<CadastroSenhaPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: CadastroWidget(
              label: "Digite a senha para a sua conta",
              labelInput: "Senha",
              proxTela: CadastroGeneroPage(),
            ),
          ),
        ),
      ),
    );
  }
}
