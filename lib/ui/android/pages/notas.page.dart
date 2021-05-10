import 'package:aima/ui/shared/pages/embreve.page.dart';
import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class NotasPage extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidgetGeneric(
              typeButton: ElevatedButton(
                child: Text("ADICIONAR ANOTAÇÃO DO DIA"),
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
            SizedBox(
              height: 20,
            ),
            ButtonWidgetGeneric(
              typeButton: ElevatedButton(
                child: Text("ADICIONAR HUMOR DO DIA"),
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
            SizedBox(
              height: 20,
            ),
            ButtonWidgetGeneric(
              typeButton: ElevatedButton(
                child: Text("ADICIONAR SINTOMAS DO DIA"),
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
            SizedBox(
              height: 20,
            ),
            ButtonWidgetGeneric(
              typeButton: ElevatedButton(
                child: Text("ADICIONAR EVENTO NOVO"),
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
      ),
    );
  }
}
