import 'package:flutter/material.dart';

class CicloDiaWidget extends StatelessWidget {
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
              "1",
              style: Theme.of(context).textTheme.headline4,
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
