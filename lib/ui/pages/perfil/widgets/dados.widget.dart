import 'package:aima/ui/pages/embreve/embreve.page.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class DadosPerfilWidget extends StatelessWidget {
  const DadosPerfilWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.8),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Text(
                  "Informações pessoais:",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                    text: TextSpan(
                        text: "Mylla, mulher.",
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                ),
              ],
            ),
          ),
          ButtonWidgetGeneric(
            typeButton: OutlinedButton(
              child: Text("ALTERAR DADOS"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmBrevePage(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ButtonWidgetGeneric(
            typeButton: OutlinedButton(
              child: Text("ALTERAR FOTO"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmBrevePage(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ButtonWidgetGeneric(
            typeButton: OutlinedButton(
              child: Text("BACKUP"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmBrevePage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
