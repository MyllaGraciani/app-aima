import 'package:aima/ui/pages/notas/estadosEmo.page.dart';
import 'package:aima/ui/shared/widgets/appbar.widget.dart';
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
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
                ),
                Container(
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
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
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
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
                ),
                Container(
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
