import 'package:aima/ui/android/pages/cadastro-pages/cadastro.senha.page.dart';
import 'package:aima/ui/shared/widgets/cadastro.widget.dart';
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
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: CadastroWidget(
              label: "Qual é o seu e-mail",
              labelInput: "E-mail",
              proxTela: CadastroSenhaPage(),
            ),
          ),
        ),
      ),
    );
  }
}
