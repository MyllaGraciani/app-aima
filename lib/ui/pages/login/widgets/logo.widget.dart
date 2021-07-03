import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Image.asset(
            "assets/logo.png",
          ),
        ),
        Text(
          "aíma",
          style: Theme.of(context).textTheme.headline3,
        )
      ],
    );
  }
}
