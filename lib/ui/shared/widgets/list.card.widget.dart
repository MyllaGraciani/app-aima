import 'package:aima/ui/shared/widgets/item.card.widget.dart';
import 'package:flutter/material.dart';

class ListCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 90,
      color: Colors.amber,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ItemCardWidget(),
          ItemCardWidget(),
          ItemCardWidget(),
          ItemCardWidget(),
          ItemCardWidget(),
          ItemCardWidget(),
          ItemCardWidget(),
          ItemCardWidget(),
          ItemCardWidget(),
          ItemCardWidget(),
        ],
      ),
    );
  }
}
