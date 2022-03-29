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
          color: Colors.red,
        ),
        DadosPerfilWidget(),
      ],
    ));
  }
}
