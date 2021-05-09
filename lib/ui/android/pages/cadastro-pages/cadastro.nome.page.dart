import 'package:aima/ui/android/pages/cadastro-pages/cadastro.email.page.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:aima/ui/shared/widgets/input.widget.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Digite o seu nome ou apelido ",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 40,
                ),
                InputWidget(
                  label: "Nome ou apelido",
                  typeKeyboard: TextInputType.text,
                  obscure: false,
                ),
                SizedBox(
                  height: 40,
                ),
                ButtonWidgetGeneric(
                  typeButton: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CadastroEmailPage(),
                        ),
                      );
                    },
                    child: Text("Próximo"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
