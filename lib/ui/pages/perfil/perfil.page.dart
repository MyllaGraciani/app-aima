import 'package:aima/ui/pages/perfil/widgets/dados.widget.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Image.network(
              "https://images.unsplash.com/photo-1630513807049-9a9858825508?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80",
              fit: BoxFit.fill),
        ),
        DadosPerfilWidget(),
      ],
    ));
  }
}
