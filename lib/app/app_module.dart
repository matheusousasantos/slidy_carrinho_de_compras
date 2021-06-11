import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_carrinho_de_compras/app/app_widget.dart';
import 'package:slidy_carrinho_de_compras/app/shared/stores/carrinho/carrinho_store.dart';
import 'modules/carrinho/carrinho_module.dart';
import 'modules/detalhes_produto/detalhes_produto_module.dart';
import 'modules/loja/loja_module.dart';
import 'modules/pagamento/pagamento_module.dart';
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
    ModuleRoute('/detalhesProduto', module: DetalhesProdutoModule()),
    ModuleRoute('/pagamento', module: PagamentoModule()),
    ModuleRoute('/carrinho', module: CarrinhoModule()),
  ];

  Widget get bootstrap => AppWidget();
}
