import 'package:aima/ui/pages/cadastro/cadastro-ciclo/duracao.menstrual.page.dart';
import 'package:aima/ui/pages/cadastro/widget/cadastro.widget.dart';
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

    prefs.setString('duracaoCiclo', duracaoCiclo);
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
                "Qual o seu nome ou apelido?",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
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
              SizedBox(
                height: 40,
              ),
              ButtonWidgetGeneric(
                typeButton: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      getPreferences(controller.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DuracaoCicloPage()),
                      );
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
