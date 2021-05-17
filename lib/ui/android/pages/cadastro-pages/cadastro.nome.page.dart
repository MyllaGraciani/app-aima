import 'package:aima/ui/android/pages/cadastro-pages/cadastro.email.page.dart';
import 'package:aima/ui/shared/widgets/cadastro.widget.dart';
import 'package:flutter/material.dart';

class CadastroNomePage extends StatefulWidget {
  @override
  _CadastroNomePageState createState() => _CadastroNomePageState();
}

class _CadastroNomePageState extends State<CadastroNomePage> {
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
              label: "Digite o seu nome ou apelido ",
              labelInput: "Nome ou apelido",
              proxTela: CadastroEmailPage(),
            ),
          ),
        ),
      ),
    );
  }
}
