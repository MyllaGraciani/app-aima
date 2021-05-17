import 'package:flutter/material.dart';

class BoxNotasWidget extends StatelessWidget {
  final String titleAsk;
  final String descButton;
  final Icon iconButton;

  BoxNotasWidget(
      {required this.titleAsk,
      required this.descButton,
      required this.iconButton});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(
        //   titleAsk,
        //   style: Theme.of(context).textTheme.headline5,
        // ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Theme.of(context).accentColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: Theme.of(context).accentColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          width: 220,
          height: 50,
          child: TextButton.icon(
            onPressed: () {},
            icon: iconButton,
            label: Text(
              descButton,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ],
    );
  }
}
