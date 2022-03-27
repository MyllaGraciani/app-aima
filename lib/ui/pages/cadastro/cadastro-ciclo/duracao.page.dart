import 'package:aima/ui/shared/validators/cadastro.valid.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DuracaoCicloPage extends StatefulWidget {
  @override
  _DuracaoCicloPageState createState() => _DuracaoCicloPageState();
}

class _DuracaoCicloPageState extends State<DuracaoCicloPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  getPreferences(duracaoCiclo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('duracaoCiclo', duracaoCiclo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Qual a média da duração de seu ciclo em dias?",
                    style: MediaQuery.of(context).size.width > 760
                        ? Theme.of(context).textTheme.headline3
                        : Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: controller,
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Exemplo: 27",
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
                      if (CadastroValidator.instance.cicloValido(value) ==
                          false) {
                        return "Digite um valor que seja maior que 20.";
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
                          getPreferences(int.parse(controller.text));

                          Navigator.of(context)
                              .pushNamed('/cadastro_duracao_menstruacao');
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
    );
  }
}
