import 'package:aima/ui/android/pages/cadastro-pages/cadastro.senha.page.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:aima/ui/shared/widgets/input.widget.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Digite o seu melhor e-mail",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 40,
                ),
                InputWidget(
                  label: "E-mail",
                  typeKeyboard: TextInputType.emailAddress,
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
                          builder: (context) => CadastroSenhaPage(),
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
