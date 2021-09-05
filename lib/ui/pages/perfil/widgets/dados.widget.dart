import 'package:aima/ui/pages/embreve/embreve.page.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DadosPerfilWidget extends StatefulWidget {
  DadosPerfilWidget({Key? key}) : super(key: key);

  @override
  State<DadosPerfilWidget> createState() => _DadosPerfilWidgetState();
}

class _DadosPerfilWidgetState extends State<DadosPerfilWidget> {
  Future<List<dynamic>> getPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List _dados = [];
    _dados.add((prefs.getString('nomeUSer') ?? ''));
    _dados.add((prefs.getInt('duracaoCiclo') ?? 0).toString());
    _dados.add((prefs.getInt('duracaoMenstruacao') ?? 0).toString());

    return _dados;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: getPreferences(),
      builder: (context, futuro) {
        if (futuro.hasData) {
          return Container(
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        "Informações pessoais:",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nome: " + futuro.data![0],
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            "Média da duração do ciclo: " +
                                futuro.data![1] +
                                " dias",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            "Média da duração do período menstrual: " +
                                futuro.data![2] +
                                " dias",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ButtonWidgetGeneric(
                  typeButton: OutlinedButton(
                    child: Text("ALTERAR DADOS"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmBrevePage(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                ButtonWidgetGeneric(
                  typeButton: OutlinedButton(
                    child: Text("BACKUP"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmBrevePage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
