import 'package:flutter_modular/flutter_modular.dart';
import 'modules/compra/carrinho/carrinho_store.dart';
import 'modules/compra/compra_module.dart';
import 'modules/loja/loja_module.dart';
import 'modules/produto/produto_module.dart';
import 'modules/session/session_module.dart';
import 'shared/stores/auth/auth_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AuthStore()),
    Bind((i) => CarrinhoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LojaModule()),
    ModuleRoute('/login', module: SessionModule()),
    ModuleRoute('/produto', module: ProdutoModule()),
    ModuleRoute('/compra', module: CompraModule()),
  ];
}
