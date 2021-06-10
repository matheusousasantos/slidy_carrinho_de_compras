import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_carrinho_de_compras/app/modules/session/session_store.dart';
import 'package:flutter/material.dart';

class SessionPage extends StatefulWidget {
  final String title;
  const SessionPage({Key? key, this.title = 'SessionPage'}) : super(key: key);
  @override
  SessionPageState createState() => SessionPageState();
}

class SessionPageState extends State<SessionPage> {
  final SessionStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.amber,
              height: 250,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    controller: store.emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: store.senhaController,
                    decoration: InputDecoration(
                      labelText: "Senha",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: store.entrar,
                      child: Text("Entrar"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
