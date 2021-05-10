import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  final String titleAsk;
  final String descButton;
  final Icon iconButton;

  BoxWidget(
      {required this.titleAsk,
      required this.descButton,
      required this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleAsk,
          style: Theme.of(context).textTheme.headline5,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          width: double.maxFinite,
          height: 100,
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
