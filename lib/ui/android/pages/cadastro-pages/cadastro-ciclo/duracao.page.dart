import 'package:aima/ui/android/pages/cadastro-pages/cadastro-ciclo/duracao.menstrual.page.dart';
import 'package:aima/ui/shared/widgets/cadastro.widget.dart';
import 'package:flutter/material.dart';

class DuracaoCicloPage extends StatefulWidget {
  @override
  _DuracaoCicloPageState createState() => _DuracaoCicloPageState();
}

class _DuracaoCicloPageState extends State<DuracaoCicloPage> {
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
                  label: "Qual a média da duração do seu ciclo?",
                  labelInput: "E-mail",
                  proxTela: DuracaoMenstrualPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
