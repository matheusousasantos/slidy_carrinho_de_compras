import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'produto_store.dart';

class ProdutoPage extends StatefulWidget {
  final String nomeDaLoja;
  final String id;

  const ProdutoPage({Key? key, required this.nomeDaLoja, required this.id}) : super(key: key);
  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends ModularState<ProdutoPage, ProdutoStore> {
    final ProdutoStore store = Modular.get();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nomeDaLoja),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Modular.to.pushNamed("/carrinho/vindo da compra");
          },
          child: Icon(Icons.shopping_cart, color: Colors.white)),
      body: Observer(
        builder: (_) {
          return GridView.builder(
            itemCount: store.produtos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .7),
            itemBuilder: (_, index) {
              var current = store.produtos[index];
              print(current);
              return InkWell(
                onTap: () {
                  Modular.to.pushNamed('/detalhesProduto', arguments: current);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage("${current.imagem}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    current.nome,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "R\$ ${current.preco}",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "R\$ ${current.preco}",
                                  style: TextStyle(
                                    color: Colors.red[300],
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${current.descricao}",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}