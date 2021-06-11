import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'carrinho_lista_produtos_controller.dart';

class CarrinhoListaProdutosWidget extends StatefulWidget {
  @override
  _CarrinhoListaProdutosWidgetState createState() =>
      _CarrinhoListaProdutosWidgetState();
}

class _CarrinhoListaProdutosWidgetState extends ModularState<
    CarrinhoListaProdutosWidget, CarrinhoListaProdutosController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.listaProdutos.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var current = controller.listaProdutos[index];
        return Card(
          margin: EdgeInsets.all(5),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(current.produto.imagem),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${current.produto.nome}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "R\$ ${current.produto.preco}",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      current.remover();
                    },
                    icon: Icon(Icons.remove_circle, color: Colors.red[400])),
                Observer(builder: (BuildContext context) {
                  return Text(
                    "${current.quantidade}",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  );
                }),
                IconButton(
                    onPressed: () {
                      current.adicionar();
                    },
                    icon: Icon(Icons.add_circle, color: Colors.blue[400]))
              ],
            ),
          ),
        );
      },
    );
  }
}
