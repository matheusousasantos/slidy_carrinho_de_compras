import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'loja_store.dart';

class LojaPage extends StatefulWidget {
  final String title;
  const LojaPage({Key? key, required this.title}) : super(key: key);

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends ModularState<LojaPage, LojaStore> {
  //use 'store' variable to access store

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Observer(builder: (_) {
        if (store.isLogged) {
          return FloatingActionButton(
            onPressed: () {
              Modular.to.pushNamed("/compra/carrinho/vindo da Loja");
            },
            child: Icon(Icons.shopping_cart),
          );
        } else {
          return FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              Modular.to.pushNamed("/login");
            },
            child: Icon(Icons.person),
          );
        }
      }),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 250,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/logo_bwolf.png",
                  height: 150,
                ),
                Text("Think like a wolf")
              ],
            ),
          ),
          Expanded(
            child: Observer(builder: (_) {
              if (store.lojas == []) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (store.lojas.length == 0) {
                return Center(
                  child: Text("Nenhum dado encontrado!!"),
                );
              }

              return ListView.builder(
                itemCount: store.lojas.length,
                itemBuilder: (BuildContext context, int index) {
                  var currentItem = store.lojas[index];

                  return ListTile(
                    onTap: () {
                      Modular.to.pushNamed(
                          "/produto/${currentItem.nome}/${currentItem.logo}/${currentItem.id}");
                    },
                    title: Text(
                      "${currentItem.nome}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      "Melhor Loja",
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/${currentItem.logo}"),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}