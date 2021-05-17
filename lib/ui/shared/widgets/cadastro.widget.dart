import 'package:flutter/material.dart';

import 'button.widget.dart';
import 'input.widget.dart';

class CadastroWidget extends StatelessWidget {
  final String label;
  final String labelInput;

  const CadastroWidget({required this.label, required this.labelInput});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          height: 40,
        ),
        InputWidget(
          label: labelInput,
          typeKeyboard: TextInputType.text,
          obscure: false,
        ),
        SizedBox(
          height: 40,
        ),
        ButtonWidgetGeneric(
          typeButton: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => CadastroEmailPage(),
              //   ),
              // );
            },
            child: Text("Próximo"),
          ),
        ),
      ],
    );
  }
}
