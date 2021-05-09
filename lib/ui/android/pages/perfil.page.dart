import 'package:aima/ui/shared/widgets/appbar.widget.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          label: 'Perfil',
          textStyleSub: Theme.of(context).textTheme.subtitle1,
        ),
        body: Stack(
          children: [
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Image.network(
                  "https://images.unsplash.com/photo-1576899244085-008f88c463ce?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDEwfHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  fit: BoxFit.fill),
            ),
            Container(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Text(
                          "Informações pessoais:",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: RichText(
                            text: TextSpan(
                                text: "Mylla, mulher.",
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonWidgetGeneric(
                    typeButton: OutlinedButton(
                      child: Text("ALTERAR DADOS"),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 20),
                  ButtonWidgetGeneric(
                    typeButton: OutlinedButton(
                      child: Text("ALTERAR FOTO"),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 20),
                  ButtonWidgetGeneric(
                    typeButton: OutlinedButton(
                      child: Text("BACKUP"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
