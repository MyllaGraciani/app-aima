import 'package:aima/ui/pages/adicionais/adicionais.page.dart';
import 'package:aima/ui/pages/calendario/calendario.page.dart';
import 'package:aima/ui/pages/home/home.page.dart';
import 'package:aima/ui/pages/notas/notas.page.dart';
import 'package:aima/ui/pages/perfil/perfil.page.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  //teste
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        // quantidade de itens que o menu vai ter
        length: 5,
        child: Scaffold(
          //páginas que serão mostradas na mesma ordem dos respectivos icones
          body: TabBarView(
            children: [
              HomePage(),
              CalendarioPage(),
              NotasPage(),
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
            unselectedLabelColor:
                Theme.of(context).primaryColor.withOpacity(0.4),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
