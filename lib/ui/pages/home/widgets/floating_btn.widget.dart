import 'package:aima/config/app.color.dart';
import 'package:flutter/material.dart';

class FloatingBtnWidget extends StatelessWidget {
  const FloatingBtnWidget({Key? key}) : super(key: key);

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
        icon: Icon(Icons.edit_calendar_outlined),
        onPressed: () {
          Navigator.pushNamed(context, '/selecionar_data');
        },
      ),
    );
  }
}
