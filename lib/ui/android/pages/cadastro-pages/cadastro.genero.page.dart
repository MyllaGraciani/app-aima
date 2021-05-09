import 'package:aima/ui/shared/pages/sucesso.page.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:aima/ui/shared/widgets/input.widget.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Digite o gênero no qual você se identifica",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 40,
                ),
                InputWidget(
                  label: "Gênero",
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
                          builder: (context) => SucessoPage(),
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
