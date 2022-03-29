import 'package:aima/ui/pages/notas/widget/elevated.btn.widget.dart';
import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:flutter/material.dart';

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
          ElevatedBtn(name: 'Sintomas', namedRoute: '/anotar_sintomas'),
          ElevatedBtn(name: 'Humores', namedRoute: '/anotar_humores'),
          ElevatedBtn(name: 'Muco', namedRoute: '/anotar_muco'),
          ElevatedBtn(name: 'Sexo', namedRoute: '/anotar_sexo'),
          ElevatedBtn(name: 'Alimentação', namedRoute: '/anotar_alimentacao'),
          ElevatedBtn(name: 'Higiene', namedRoute: '/anotar_higiene'),
        ],
      ),
    );
  }
}
