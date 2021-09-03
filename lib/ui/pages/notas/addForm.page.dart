import 'package:aima/database/sqlite/DAO/humores.dao.dart';
import 'package:aima/ui/pages/notas/humores.page.dart';
import 'package:aima/ui/shared/validators/cadastro.valid.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class AddFormPage extends StatefulWidget {
  const AddFormPage({Key? key}) : super(key: key);

  @override
  State<AddFormPage> createState() => _AddFormPageState();
}

class _AddFormPageState extends State<AddFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  Future<void> _add(String desc) async {
    HumoresDAO().inserir(desc, 3);
  }

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
                  "Deseja adicionar um novo item?",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Humor",
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
                      return "Por favor digite um texto válido";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                ButtonWidgetGeneric(
                  typeButton: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _add(controller.text);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HumoresPage(),
                          ),
                        );
                      }
                    },
                    child: Text("Adicionar"),
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
