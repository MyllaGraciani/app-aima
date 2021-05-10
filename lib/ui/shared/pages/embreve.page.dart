import 'package:aima/ui/android/pages/tabs.page.dart';
import 'package:flutter/material.dart';

class EmBrevePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TabsPage(),
                ),
              );
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
              Image.asset("assets/SittingDoodle.png"),
              Text(
                "em breve!",
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
