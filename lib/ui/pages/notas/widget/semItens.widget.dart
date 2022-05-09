import 'package:aima/config/app.assets.dart';
import 'package:aima/config/app.color.dart';
import 'package:flutter/material.dart';

class SemItens extends StatelessWidget {
  const SemItens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "Você não cadastrou nenhum item para esta categoria ainda.",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          Image.asset(AppAssets.iconeEmBreve, height: 200),
          Text(
            "Clique no sinal de + e adicione novos itens.",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
