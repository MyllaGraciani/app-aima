import 'package:aima/ui/shared/pages/embreve.page.dart';
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
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmBrevePage(),
                        ),
                      );
                    },
                    child: Text(
                      "GRÁFICOS",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmBrevePage(),
                        ),
                      );
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
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmBrevePage(),
                        ),
                      );
                    },
                    child: Text(
                      "HIGIENE",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmBrevePage(),
                        ),
                      );
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
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmBrevePage(),
                        ),
                      );
                    },
                    child: Text(
                      "LUA",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmBrevePage(),
                        ),
                      );
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
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmBrevePage(),
                        ),
                      );
                    },
                    child: Text(
                      "EXAME MÉDICO",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmBrevePage(),
                        ),
                      );
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
