import 'package:aima/config/app.color.dart';
import 'package:flutter/material.dart';

class FloatingBtnWidget extends StatelessWidget {
  final Icon iconButton;
  final String nameRoute;

  const FloatingBtnWidget(
      {Key? key, required this.iconButton, required this.nameRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        border: Border.all(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        color: Colors.white70,
        icon: iconButton,
        onPressed: () {
          Navigator.of(context).pushNamed(nameRoute);
        },
      ),
    );
  }
}
