import 'package:aima/config/app.color.dart';
import 'package:aima/ui/pages/notas/notas.page.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class SemRegistroWidget extends StatelessWidget {
  const SemRegistroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Center(
            child: Text(
              "Você não registrou o seu dia ainda.",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonWidgetGeneric(
            typeButton: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NotasPage()),
                );
              },
              child: Text("Registrar"),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
