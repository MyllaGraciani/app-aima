import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HumoresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        label: 'Humores',
        textStyleSub: Theme.of(context).textTheme.subtitle1,
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text("data"),
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
