import 'package:flutter/material.dart';

class SobreAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
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
                "assets/logo.png",
                width: 150,
              ),
              Text(
                "aíma",
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                "v1.0.0",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Desenvolvido por:",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
