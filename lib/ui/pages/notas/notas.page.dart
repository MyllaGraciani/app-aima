import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:flutter/material.dart';

import 'estadosEmo.page.dart';

class NotasPage extends StatelessWidget {
  const NotasPage({Key? key}) : super(key: key);
  static const int crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        label: 'Anotações',
        textStyleSub: Theme.of(context).textTheme.subtitle1,
      ),
      body: GridView.count(
        crossAxisCount: crossAxisCount,
        scrollDirection: Axis.vertical,
        childAspectRatio: 2 / 1,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        padding: EdgeInsets.all(20),
        children: [
          ElevatedButton(
            child: Text(
              "Sintomas",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EstadosEmocionaisPage(
                    idTipo: 1,
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text(
              "Humores",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EstadosEmocionaisPage(
                    idTipo: 2,
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text(
              "Muco",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EstadosEmocionaisPage(
                    idTipo: 4,
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text(
              "Sexo",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EstadosEmocionaisPage(
                    idTipo: 3,
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text(
              "Alimentação",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EstadosEmocionaisPage(
                    idTipo: 1,
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text(
              "Higiene",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EstadosEmocionaisPage(
                    idTipo: 1,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
