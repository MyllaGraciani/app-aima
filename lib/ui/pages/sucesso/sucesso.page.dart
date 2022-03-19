import 'package:flutter/material.dart';

class SucessoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
            icon: Icon(Icons.close),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  "assets/LovingDoodle.png"), //TODOdiminuir o tamanho da imagem
              Text(
                "Obrigada!",
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
