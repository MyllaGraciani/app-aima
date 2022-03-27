import 'package:aima/ui/shared/validators/cadastro.valid.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroNomePage extends StatefulWidget {
  @override
  _CadastroNomePageState createState() => _CadastroNomePageState();
}

class _CadastroNomePageState extends State<CadastroNomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  getPreferences(nome) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('nomeUSer', nome);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Qual o seu nome?",
                  style: MediaQuery.of(context).size.width > 760
                      ? Theme.of(context).textTheme.headline3
                      : Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome ou apelido",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  validator: (value) {
                    if (CadastroValidator.instance.nomeValido(value) == false) {
                      return "Por favor digite um nome válido";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidgetGeneric(
                  typeButton: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        getPreferences(controller.text);
                        Navigator.of(context).pushNamed('/cadastro_senha');
                      }
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
