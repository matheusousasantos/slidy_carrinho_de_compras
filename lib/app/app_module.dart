import 'package:flutter_modular/flutter_modular.dart';
import 'modules/auth/auth_module.dart';
import 'modules/compra/carrinho/carrinho_store.dart';
import 'modules/compra/compra_module.dart';
import 'modules/produto/produto_module.dart';
import 'shared/stores/auth/auth_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AuthStore()),
    Bind((i) => CarrinhoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute('/produto', module: ProdutoModule()),
    ModuleRoute('/compra', module: CompraModule()),
  ];
}
