import 'package:aima/config/app.assets.dart';
import 'package:aima/config/app.color.dart';
import 'package:aima/controllers/valueNotifier.dart';
import 'package:aima/database/sqlite/DAO/ciclo.dao.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class SemCicloWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Você não cadastrou nenhum ciclo ainda.",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(AppAssets.iconeEmBreve, height: 200),
          ValueListenableBuilder(
              valueListenable: dataAtual,
              builder: (context, dataAtual, child) {
                if (dataAtual != null && dataAtual is String) {
                  return ButtonWidgetGeneric(
                    typeButton: ElevatedButton(
                      onPressed: () {
                        CicloDAO().iniciarCiclo(dataAtual, "atual");

                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: Text("Iniciar novo ciclo"),
                    ),
                  );
                } else {
                  return Text("houve um erro");
                }
              })
        ],
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor.withOpacity(0.1),
      ),
    );
  }
}
