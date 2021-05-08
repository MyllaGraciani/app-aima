import 'package:flutter/material.dart';

class CicloDescWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text.rich(
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
        ],
      ),
    );
  }
}
