import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_carrinho_de_compras/app/modules/compra/carrinho/widgets/carrinho_lista_produtos/carrinho_lista_produtos_controller.dart';
import 'carrinho_controller.dart';
import 'carrinho_page.dart';

class CarrinhoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => CarrinhoListaProdutosController()),
        Bind((i) => CarrinhoTotalController()),
        Bind((i) => CarrinhoController()),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:title', child: (_, args) => CarrinhoPage(title: args.params['title'])),
  ];
}

class CarrinhoTotalController {
}
