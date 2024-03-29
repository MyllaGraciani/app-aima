import 'package:aima/ui/shared/validators/cadastro.valid.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroSenhaPage extends StatefulWidget {
  @override
  _CadastroSenhaPageState createState() => _CadastroSenhaPageState();
}

class _CadastroSenhaPageState extends State<CadastroSenhaPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  getPreferences(tokenUser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('tokenUser', tokenUser);
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
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Digite uma senha para o app:",
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
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Senha",
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
                        if (CadastroValidator.instance.nomeValido(value) ==
                            false) {
                          return "Digite uma senha com mais que 4 e menos que 8 caracteres.";
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

                            Navigator.of(context)
                                .pushNamed('/cadastro_duracao_ciclo');
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
        ),
      ),
    );
  }
}
