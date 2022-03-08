import 'package:aima/config/app.color.dart';
import 'package:aima/database/sqlite/DAO/ciclo.dao.dart';
import 'package:aima/ui/pages/tabs-menu/tabs.page.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class SemCiloWidget extends StatelessWidget {
  final String dataAtual;
  const SemCiloWidget({Key? key, required this.dataAtual}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Center(
            child: Text(
              "Você não cadastrou nenhum ciclo ainda.",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ButtonWidgetGeneric(
            typeButton: ElevatedButton(
              onPressed: () {
                CicloDAO().iniciarCiclo(dataAtual, "atual");

                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: Text("Iniciar novo ciclo"),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: AppColors.lightColor.withOpacity(0.4),
      ),
    );
  }
}
