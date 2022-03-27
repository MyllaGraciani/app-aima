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
                  name: 'Gráficos',
                  nameRoute: '/em_breve',
                ),
                ContainerWidget(
                  name: 'Autocuidado',
                  nameRoute: '/em_breve',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContainerWidget(
                  name: 'Lua',
                  nameRoute: '/em_breve',
                ),
                ContainerWidget(
                  name: 'Medicamento',
                  nameRoute: '/em_breve',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContainerWidget(
                  name: 'Exame médico',
                  nameRoute: '/em_breve',
                ),
                ContainerWidget(
                  name: 'Metas',
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
