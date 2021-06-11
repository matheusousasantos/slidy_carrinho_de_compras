import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_carrinho_de_compras/app/modules/carrinho/widgets/carrinho_lista_produtos/carrinho_lista_produtos_controller.dart';
import 'package:slidy_carrinho_de_compras/app/shared/stores/carrinho/carrinho_store.dart';
import 'carrinho_controller.dart';
import 'carrinho_page.dart';
import 'widgets/carrinho_total/carrinho_total_controller.dart';

class CarrinhoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => CarrinhoListaProdutosController(i.get<CarrinhoStore>())),
        Bind((i) => CarrinhoTotalController(i.get<CarrinhoStore>())),
        Bind((i) => CarrinhoController()),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:title', child: (_, args) => CarrinhoPage(title: args.params['title'])),
  ];
}