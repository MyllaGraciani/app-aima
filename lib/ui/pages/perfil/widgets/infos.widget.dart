import 'package:flutter/material.dart';

class InfosPerfilWidget extends StatelessWidget {
  final futureData;
  final String nomeCampo;
  final String? subNome;

  const InfosPerfilWidget(
      {Key? key,
      this.subNome,
      required this.futureData,
      required this.nomeCampo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      nomeCampo + futureData + subNome!,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
