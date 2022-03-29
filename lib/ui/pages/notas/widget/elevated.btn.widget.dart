import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  final name;
  final namedRoute;
  const ElevatedBtn({Key? key, required this.name, required this.namedRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      onPressed: () {
        Navigator.pushNamed(context, namedRoute);
      },
    );
  }
}
