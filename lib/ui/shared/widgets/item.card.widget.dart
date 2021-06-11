import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: Theme.of(context).accentColor,
          ),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(child: Icon(Icons.ac_unit)),
    );
  }
}
