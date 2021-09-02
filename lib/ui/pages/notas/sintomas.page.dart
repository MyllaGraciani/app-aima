import 'package:aima/domain/entities/sintoma.model.dart';
import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:flutter/material.dart';

class SintomasPage extends StatefulWidget {
  @override
  State<SintomasPage> createState() => _SintomasPageState();
}

class _SintomasPageState extends State<SintomasPage> {
  bool _boolCheck = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SintomasModel>>(builder: (context, futuro) {
      if (futuro.hasData) {
        List<SintomasModel>? lista = futuro.data;
        return Scaffold(
            appBar: AppBarWidget(
              label: 'Sintomas',
              textStyleSub: Theme.of(context).textTheme.subtitle1,
            ),
            body: ListView.builder(
              itemCount: lista!.length,
              itemBuilder: (context, i) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  selected: _boolCheck,
                  value: _boolCheck,
                  title: Text(lista[i].nome),
                  onChanged: (value) {
                    setState(() {
                      _boolCheck = !_boolCheck;
                    });
                  },
                );
              },
            ));
      } else {
        return Scaffold();
      }
    });
  }
}
