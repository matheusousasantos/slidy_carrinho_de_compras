import 'package:slidy_carrinho_de_compras/app/modules/carrinho/carrinho_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_carrinho_de_compras/app/shared/stores/carrinho/carrinho_store.dart';

import 'detalhes_produto_page.dart';
import 'detalhes_produto_store.dart';

class DetalhesProdutoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetalhesProdutoStore(i.get<CarrinhoStore>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => DetalhesProdutoPage(produtoModel: args.data)),
    ModuleRoute('/carrinho',
        module: CarrinhoModule(), transition: TransitionType.fadeIn),
  ];
}
