import 'package:flutter/material.dart';

class CicloDiaWidget extends StatelessWidget {
  final String diaCiclo;

  const CicloDiaWidget({Key? key, required this.diaCiclo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Container(
            child: Image.asset("assets/ciclo.png"),
          ),
        ),
        Column(
          children: [
            Text(
              "dia",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              diaCiclo,
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "do ciclo",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        )
      ],
    );
  }
}
