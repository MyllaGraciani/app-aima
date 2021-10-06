import 'package:aima/database/sqlite/DAO/estadosEmo.dao.dart';
import 'package:aima/database/sqlite/DAO/tiposNotas.dao.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  int _selected = 1;
  Future<List<TipoNotasModel>> _buscar() async {
    return TipoNotasDAO().find();
  }

  Future<void> _add(String desc, int id) async {
    EstadosEmocionaisDAO().inserir(desc, id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TipoNotasModel>>(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<TipoNotasModel>? lista = futuro.data;
            return Scaffold(
              body: Padding(
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
                      Text(
                        "Categoria:",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      DropdownButton<int>(
                        isExpanded: true,
                        value: _selected,
                        items: lista!.map((e) {
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
                      SizedBox(
                        height: 20,
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
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        validator: (value) {
                          if (CadastroValidator.instance.nomeValido(value) ==
                              false) {
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
                              await _add(controller.text, _selected);

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
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
