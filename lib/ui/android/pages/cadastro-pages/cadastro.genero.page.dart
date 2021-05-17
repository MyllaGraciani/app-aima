import 'package:aima/ui/shared/pages/sucesso.page.dart';
import 'package:aima/ui/shared/widgets/cadastro.widget.dart';
import 'package:flutter/material.dart';

class CadastroGeneroPage extends StatefulWidget {
  @override
  _CadastroGeneroPageState createState() => _CadastroGeneroPageState();
}

class _CadastroGeneroPageState extends State<CadastroGeneroPage> {
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
              label: "Digite o gênero no qual você se identifica",
              labelInput: "Gênero",
              proxTela: SucessoPage(),
            ),
          ),
        ),
      ),
    );
  }
}
