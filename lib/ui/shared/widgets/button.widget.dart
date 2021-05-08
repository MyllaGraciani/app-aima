import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonWidgetGeneric extends StatelessWidget {
  final Widget typeButton;

  ButtonWidgetGeneric({required this.typeButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      child: typeButton,
    );
  }
}
