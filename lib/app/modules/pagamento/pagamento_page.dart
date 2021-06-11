import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'models/pagamento_model.dart';
import 'pagamento_store.dart';

class PagamentoPage extends StatefulWidget {
  final String title;
  const PagamentoPage({Key? key, this.title = "Dados Comprador"})
      : super(key: key);

  @override
  _PagamentoPageState createState() => _PagamentoPageState();
}

class _PagamentoPageState extends ModularState<PagamentoPage, PagamentoStore> {
  final PagamentoStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Vamos Precisar de mais Alguns dados!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Continuar"),
                onPressed: () {
                  Modular.to.pushNamed("/endereco", arguments: PagamentoModel());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
