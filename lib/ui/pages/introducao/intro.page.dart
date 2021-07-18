import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const kIcons = <Icon>[
    Icon(Icons.event),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.alarm),
    Icon(Icons.face),
    Icon(Icons.language),
  ];

  static final kIntro = <Widget>[
    Column(
      children: [Icon(Icons.event), Text("data")],
    ),
    Column(
      children: [Icon(Icons.home), Text("home")],
    ),
    Column(
      children: [Icon(Icons.android), Text("android")],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: kIntro.length,
        child: Builder(
          builder: (BuildContext context) => Container(
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const TabPageSelector(),
                  Expanded(
                    child: TabBarView(children: kIntro),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final TabController? controller =
                          DefaultTabController.of(context);
                      if (!controller!.indexIsChanging) {
                        for (var i = 3; i > 0; i--) {
                          controller.animateTo(kIntro.length - i);
                        }
                      }
                    },
                    child: const Text('SKIP'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
