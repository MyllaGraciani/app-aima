import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:aima/ui/shared/widgets/ciclo.dia.widget.dart';
import 'package:aima/ui/shared/widgets/list.card.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        label: 'Olá, Mylla ',
        textStyleSub: Theme.of(context).textTheme.subtitle1,
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: CicloDiaWidget(),
                ),
                Text(
                  "Humores",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                ListCardWidget(),
                Text(
                  "Sintomas",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                ListCardWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
