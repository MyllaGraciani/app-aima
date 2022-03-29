import 'package:flutter/material.dart';

class SemItens extends StatelessWidget {
  const SemItens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
          child: Text(
        "Não existe nenhum item ainda, adicione através do sinal de mais.",
        style: Theme.of(context).textTheme.headline6,
      )),
    );
  }
}
