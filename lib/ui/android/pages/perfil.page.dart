import 'package:aima/ui/shared/widgets/perfil-widgets/dados.widget.dart';
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
              "https://images.unsplash.com/photo-1576899244085-008f88c463ce?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDEwfHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
              fit: BoxFit.fill),
        ),
        DadosPerfilWidget(),
      ],
    ));
  }
}
