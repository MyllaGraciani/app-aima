import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final String label;
  final TextStyle? textStyleSub;

  AppBarWidget({required this.textStyleSub, required this.label})
      : super(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                SizedBox(height: 40, child: Image.asset("assets/logo.png")),
                SizedBox(
                  width: 15,
                ),
                Text(
                  label,
                  style: textStyleSub,
                ),
              ],
            ),
          ),
        );
}
