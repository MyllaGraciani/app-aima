import 'package:aima/ui/pages/notas/widget/elevated.btn.widget.dart';
import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:flutter/material.dart';

import '../home/widgets/floating_btn.widget.dart';

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
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        children: [
          ElevatedBtn(name: 'sintomas', namedRoute: '/anotar_sintomas'),
          ElevatedBtn(name: 'humores', namedRoute: '/anotar_humores'),
          ElevatedBtn(name: 'muco', namedRoute: '/anotar_muco'),
          ElevatedBtn(name: 'sexo', namedRoute: '/anotar_sexo'),
          ElevatedBtn(name: 'alimentação', namedRoute: '/anotar_alimentacao'),
          ElevatedBtn(name: 'higiene', namedRoute: '/anotar_higiene'),
        ],
      ),
      floatingActionButton: FloatingBtnWidget(
        iconButton: Icon(Icons.add_circle_outline),
        nameRoute: '/add_categoria',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
