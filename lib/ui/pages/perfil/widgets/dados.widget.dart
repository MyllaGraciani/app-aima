import 'package:aima/ui/pages/perfil/widgets/infos.widget.dart';
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
            color: Theme.of(context).primaryColor.withOpacity(0.6),
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
                          InfosPerfilWidget(
                            futureData: futuro.data![0],
                            nomeCampo: "Nome: ",
                          ),
                          InfosPerfilWidget(
                              futureData: futuro.data![1],
                              nomeCampo: "Duração do ciclo: ",
                              subNome: " dias"),
                          InfosPerfilWidget(
                              futureData: futuro.data![2],
                              nomeCampo: "Duração da menstruação: ",
                              subNome: " dias"),
                        ],
                      ),
                    ],
                  ),
                ),
                ButtonWidgetGeneric(
                  typeButton: OutlinedButton(
                    child: Text("ALTERAR DADOS"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cadastro_nome');
                    },
                  ),
                ),
                //- implementar botão para fazer backup do banco de dados
                // const SizedBox(height: 20),
                // ButtonWidgetGeneric(
                //   typeButton: OutlinedButton(
                //     child: Text("BACKUP"),
                //     onPressed: () {
                //       Navigator.pushNamed(context, '/em_breve');
                //     },
                //   ),
                // ),
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
