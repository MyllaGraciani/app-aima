import 'package:aima/database/sqlite/DAO/humores.dao.dart';
import 'package:aima/ui/pages/notas/humores.page.dart';
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
                  "Deseja adicionar um novo humor?",
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
                    // return "Por favor digite um texto válido";
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                ButtonWidgetGeneric(
                  typeButton: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        HumoresDAO().inserir(controller.text, 3);
                        Navigator.push(
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
