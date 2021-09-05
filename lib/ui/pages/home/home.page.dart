import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:aima/ui/shared/widgets/ciclo.dia.widget.dart';
import 'package:aima/ui/shared/widgets/list.card.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        label: 'Olá,',
        textStyleSub: Theme.of(context).textTheme.subtitle1,
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Container(padding: EdgeInsets.all(16), child: CicloDiaWidget()),
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
