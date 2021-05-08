import 'package:flutter/material.dart';

class CicloDiaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            child: Image.asset("assets/ciclo.png"),
          ),
        ),
        Center(
          child: Text.rich(
            TextSpan(
              text: "dia \n",
              children: [
                TextSpan(
                  text: "1 \n",
                ),
                TextSpan(
                  text: "do ciclo",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
