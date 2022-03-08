import 'package:aima/ui/pages/tabs-menu/tabs.page.dart';
import 'package:aima/ui/shared/validators/cadastro.valid.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DuracaoMenstrualPage extends StatefulWidget {
  @override
  _DuracaoMenstrualPageState createState() => _DuracaoMenstrualPageState();
}

class _DuracaoMenstrualPageState extends State<DuracaoMenstrualPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  getPreferences(duracaoMenstruacao) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('duracaoMenstruacao', duracaoMenstruacao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Média de duração da menstruação",
                style: MediaQuery.of(context).size.width > 760
                    ? Theme.of(context).textTheme.headline3
                    : Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: InputDecoration(
                  labelText: "Exemplo: 7",
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
                  if (CadastroValidator.instance.pnValido(value) == false) {
                    return "Digite um valor menor que 12 e maior que 0.";
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

                      Navigator.of(context).pushNamed('/home');
                    }
                  },
                  child: Text("Próximo"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
