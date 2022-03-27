import 'package:aima/controllers/estadosEmo.controller.dart';
import 'package:aima/controllers/tiposNotas.controller.dart';
import 'package:aima/domain/entities/tipo_notas.model.dart';
import 'package:aima/ui/pages/tabs-menu/tabs.page.dart';
import 'package:aima/ui/shared/validators/cadastro.valid.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class AddFormPage extends StatefulWidget {
  const AddFormPage({Key? key}) : super(key: key);

  @override
  State<AddFormPage> createState() => _AddFormPageState();
}

class _AddFormPageState extends State<AddFormPage> {
  EstadosEmoController _estadosEmoController = EstadosEmoController();
  TiposNotasController _tiposNotasController = TiposNotasController();

  final TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  int _selected = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TipoNotasModel>>(
        future: _tiposNotasController.buscarTiposNotas(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<TipoNotasModel>? tipoNota = futuro.data;
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
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
                          DropdownButton<int>(
                            isExpanded: true,
                            value: _selected,
                            items: tipoNota!.map((e) {
                              return new DropdownMenuItem<int>(
                                child: Text(e.descricao),
                                value: e.id,
                              );
                            }).toList(),
                            onChanged: (value) {
                              this.setState(() {
                                _selected = value!;
                              });
                            },
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            validator: (value) {
                              if (CadastroValidator.instance
                                      .nomeValido(value) ==
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
                                  await _estadosEmoController
                                      .addEstadoEmocional(
                                          controller.text, _selected);
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
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
