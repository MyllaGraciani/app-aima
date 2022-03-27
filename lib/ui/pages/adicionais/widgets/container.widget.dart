import 'package:aima/config/app.size.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final String name;
  final String nameRoute;

  const ContainerWidget({Key? key, required this.name, required this.nameRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.of(context).dynamicScaleSize(size: 150),
      width: SizeConfig.of(context).dynamicScaleSize(size: 300),
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(nameRoute);
        },
        child: Text(
          name,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
