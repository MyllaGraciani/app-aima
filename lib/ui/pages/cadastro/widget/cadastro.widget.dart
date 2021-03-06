import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:aima/ui/shared/widgets/input.widget.dart';
import 'package:flutter/material.dart';

class CadastroWidget extends StatelessWidget {
  final String label;
  final String labelInput;
  final Widget proxTela;

  const CadastroWidget(
      {required this.label, required this.labelInput, required this.proxTela});

  Widget _tipoInput() {
    bool tipoObscure = false;
    if (labelInput == "E-mail") {
      return InputWidget(
        label: labelInput,
        typeKeyboard: TextInputType.emailAddress,
        obscure: tipoObscure,
      );
    } else if (labelInput == "Senha") {
      return InputWidget(
        label: labelInput,
        typeKeyboard: TextInputType.text,
        obscure: tipoObscure = true,
      );
    }
    return InputWidget(
      label: labelInput,
      typeKeyboard: TextInputType.text,
      obscure: tipoObscure,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 40,
            ),
            _tipoInput(),
            SizedBox(
              height: 40,
            ),
            ButtonWidgetGeneric(
              typeButton: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => proxTela,
                    ),
                  );
                },
                child: Text("Próximo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
