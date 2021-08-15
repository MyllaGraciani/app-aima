import 'package:aima/ui/pages/cadastro/widget/cadastro.widget.dart';
import 'package:aima/ui/pages/sucesso/sucesso.page.dart';
import 'package:flutter/material.dart';

class DuracaoMenstrualPage extends StatefulWidget {
  @override
  _DuracaoMenstrualPageState createState() => _DuracaoMenstrualPageState();
}

class _DuracaoMenstrualPageState extends State<DuracaoMenstrualPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  label: "Qual a duração do seu período menstrual?",
                  labelInput: "Duração",
                  proxTela: SucessoPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
