import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:aima/ui/pages/notas/widget/box.notas.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Notas2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        label: 'Anotações',
        textStyleSub: Theme.of(context).textTheme.subtitle1,
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BoxNotasWidget(
                        titleAsk: "Observações",
                        descButton: "Observações..",
                        iconButton: Icon(Icons.border_color_rounded),
                      ),
                      BoxNotasWidget(
                        titleAsk: "Observações",
                        descButton: "Sintomas..",
                        iconButton: Icon(Icons.border_color_rounded),
                      ),
                      BoxNotasWidget(
                        titleAsk: "Observações",
                        descButton: "Humores..",
                        iconButton: Icon(Icons.border_color_rounded),
                      ),
                      BoxNotasWidget(
                        titleAsk: "Observações",
                        descButton: "Escrever..",
                        iconButton: Icon(Icons.border_color_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text("data"),
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
