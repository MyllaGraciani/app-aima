import 'package:aima/config/app.size.dart';
import 'package:aima/controllers/tiposNotas.controller.dart';
import 'package:aima/ui/pages/tabs-menu/tabs.page.dart';
import 'package:aima/ui/shared/validators/cadastro.valid.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class AddCategoriaPage extends StatefulWidget {
  const AddCategoriaPage({Key? key}) : super(key: key);

  @override
  State<AddCategoriaPage> createState() => _AddCategoriaPageState();
}

class _AddCategoriaPageState extends State<AddCategoriaPage> {
  TiposNotasController _tiposNotaController = TiposNotasController();

  final TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(
              SizeConfig.of(context).dynamicScalePadding(value: 0.03)),
          child: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Deseja adicionar um novo item?",
                      style: MediaQuery.of(context).size.width > 760
                          ? Theme.of(context).textTheme.headline3
                          : Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Categoria:",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Descrição",
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
                          return "Por favor digite um texto válido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonWidgetGeneric(
                      typeButton: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _tiposNotaController
                                .addTipoNota(controller.text);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TabsPage(),
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
        ),
      ),
    );
  }
}
