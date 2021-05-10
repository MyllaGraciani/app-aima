import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:aima/ui/shared/widgets/box.widget.dart';

import 'package:flutter/material.dart';

class NotasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        label: 'Anotações',
        textStyleSub: Theme.of(context).textTheme.subtitle1,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BoxWidget(
                  titleAsk: "Observações",
                  descButton: "Escrever..",
                  iconButton: Icon(Icons.border_color_rounded),
                ),
                BoxWidget(
                  titleAsk: "Como está o seu humor?",
                  descButton: "Humores..",
                  iconButton: Icon(Icons.tag_faces_outlined),
                ),
                BoxWidget(
                  titleAsk: "Como foi o seu sono?",
                  descButton: "Sono..",
                  iconButton: Icon(Icons.hourglass_bottom),
                ),
                BoxWidget(
                  titleAsk: "Atividades feitas",
                  descButton: "Atividades..",
                  iconButton: Icon(Icons.sports_kabaddi_outlined),
                ),
                BoxWidget(
                  titleAsk: "Relação sexual",
                  descButton: "Relações..",
                  iconButton: Icon(Icons.health_and_safety_sharp),
                ),
                BoxWidget(
                  titleAsk: "Atividades feitas",
                  descButton: "Atividades..",
                  iconButton: Icon(Icons.sports_kabaddi_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
