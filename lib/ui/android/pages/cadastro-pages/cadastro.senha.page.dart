import 'package:aima/ui/android/pages/cadastro-pages/cadastro.genero.page.dart';
import 'package:aima/ui/shared/widgets/cadastro.widget.dart';
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
              label: "Digite a senha mais forte que tiver ",
              labelInput: "Senha",
              proxTela: CadastroGeneroPage(),
            ),
          ),
        ),
      ),
    );
  }
}
