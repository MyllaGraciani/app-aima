import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:flutter/material.dart';

class AdicionaisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        label: 'Configurações adicionais',
        textStyleSub: Theme.of(context).textTheme.subtitle1,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/em_breve');
                    },
                    child: Text(
                      "GRÁFICOS",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/em_breve');
                    },
                    child: Text(
                      "ALIMENTAÇÃO",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/em_breve');
                    },
                    child: Text(
                      "HIGIENE",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/em_breve');
                    },
                    child: Text(
                      "AUTOCUIDADO",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/em_breve');
                    },
                    child: Text(
                      "LUA",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/em_breve');
                    },
                    child: Text(
                      "MEDICAMENTO",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/em_breve');
                    },
                    child: Text(
                      "EXAME MÉDICO",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/em_breve');
                    },
                    child: Text(
                      "METAS",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
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
