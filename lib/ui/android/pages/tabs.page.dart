import 'package:aima/ui/android/pages/adicionais.page.dart';
import 'package:aima/ui/android/pages/notas2.page.dart';
import 'package:flutter/material.dart';

import 'calendario.page.dart';
import 'home.page.dart';
import 'perfil.page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // quantidade de itens que o menu vai ter
      length: 5,
      child: Scaffold(
        //páginas que serão mostradas na mesma ordem dos respectivos icones
        body: TabBarView(
          children: [
            HomePage(),
            CalendarioPage(),
            Notas2Page(),
            AdicionaisPage(),
            PerfilPage(),
          ],
        ),
        //menu com os icones
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              icon: new Icon(Icons.home),
            ),
            Tab(
              icon: new Icon(Icons.calendar_today),
            ),
            Tab(
              icon: new Icon(Icons.note_add_rounded),
            ),
            Tab(
              icon: new Icon(Icons.menu),
            ),
            Tab(
              icon: new Icon(Icons.person_rounded),
            ),
          ],
          //estilos do menu
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Theme.of(context).primaryColor.withOpacity(0.4),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
