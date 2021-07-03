import 'package:aima/ui/pages/cadastro/cadastro.nome.page.dart';
import 'package:aima/ui/pages/login/widgets/logo.widget.dart';
import 'package:aima/ui/shared/widgets/button.widget.dart';
import 'package:aima/ui/shared/widgets/input.widget.dart';
import 'package:flutter/material.dart';

import '../tabs-menu/tabs.page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LogoWidget(),
                        SizedBox(
                          height: 10,
                        ),
                        InputWidget(
                          label: "E-mail",
                          typeKeyboard: TextInputType.emailAddress,
                          obscure: false,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InputWidget(
                          label: "Senha",
                          typeKeyboard: TextInputType.text,
                          obscure: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonWidgetGeneric(
                          typeButton: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TabsPage(),
                                ),
                              );
                            },
                            child: Text("Entrar"),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ButtonWidgetGeneric(
                          typeButton: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CadastroNomePage(),
                                ),
                              );
                            },
                            child: Text("Cadastrar"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
