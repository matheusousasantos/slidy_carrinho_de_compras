import 'package:slidy_carrinho_de_compras/app/modules/compra/compra_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'carrinho/carrinho_module.dart';
import 'compra_page.dart';

class CompraModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CompraStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => CompraPage(produtoModel: args.data)),
    ModuleRoute('/carrinho',
        module: CarrinhoModule(), transition: TransitionType.fadeIn),
  ];
}
