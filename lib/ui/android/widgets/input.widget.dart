import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextInputType typeKeyboard;
  final bool obscure;

  const InputWidget(
      {Key? key,
      required this.label,
      required this.typeKeyboard,
      required this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: typeKeyboard,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
      style: TextStyle(color: Theme.of(context).primaryColor),
    );
  }
}
