import 'package:aima/ui/android/pages/adicionais.page.dart';
import 'package:aima/ui/android/pages/notas.page.dart';
import 'package:flutter/material.dart';

import 'calendario.page.dart';
import 'home.page.dart';
import 'perfil.page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: [
            HomePage(),
            CalendarioPage(),
            NotasPage(),
            AdicionaisPage(),
            PerfilPage(),
          ],
        ),
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
