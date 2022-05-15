import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:flutter/material.dart';

import 'widgets/container.widget.dart';

class AdicionaisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        label: 'Configurações adicionais',
        textStyleSub: Theme.of(context).textTheme.subtitle1,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContainerWidget(
                  name: 'gráficos',
                  nameRoute: '/em_breve',
                ),
                ContainerWidget(
                  name: 'autocuidado',
                  nameRoute: '/em_breve',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContainerWidget(
                  name: 'lua',
                  nameRoute: '/em_breve',
                ),
                ContainerWidget(
                  name: 'medicamento',
                  nameRoute: '/em_breve',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContainerWidget(
                  name: 'exame médico',
                  nameRoute: '/em_breve',
                ),
                ContainerWidget(
                  name: 'metas',
                  nameRoute: '/em_breve',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
