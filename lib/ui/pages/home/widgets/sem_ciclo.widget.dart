import 'package:aima/config/app.color.dart';
import 'package:aima/config/configuracoes.dart';
import 'package:aima/database/sqlite/DAO/ciclo.dao.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class SemCiloWidget extends StatelessWidget {
  final String _dataAtual = Configuracoes().dataAtual;

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
                CicloDAO().iniciarCiclo(_dataAtual, "atual");

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
