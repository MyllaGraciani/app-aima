import 'package:flutter/material.dart';

class AddEstadoIcon extends StatelessWidget {
  const AddEstadoIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/add_estado_emocional');
      },
      icon: Icon(Icons.add),
    );
  }
}
