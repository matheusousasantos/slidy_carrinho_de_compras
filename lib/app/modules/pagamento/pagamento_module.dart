import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_carrinho_de_compras/app/shared/stores/auth/auth_store.dart';
import 'pagamento_page.dart';
import 'pagamento_store.dart';
import 'pages/dados_endereco/dados_endereco_controller.dart';
import 'pages/dados_endereco/dados_endereco_page.dart';
import 'pages/dados_pagamento/dados_pagamento_controller.dart';
import 'pages/dados_pagamento/dados_pagamento_page.dart';
import 'pages/pagamento_sucesso/pagamento_sucesso_controller.dart';
import 'pages/pagamento_sucesso/pagamento_sucesso_page.dart';

class PagamentoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => DadosEnderecoController(i.get<PagamentoStore>())),
        Bind((i) => DadosPagamentoController(i.get<PagamentoStore>())),
        Bind((i) => PagamentoSucessoController(i.get<PagamentoStore>())),

        //stores
        Bind((i) => PagamentoStore(i.get<AuthStore>())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PagamentoPage()),
    ChildRoute('/endereco', child: (_, args) => DadosEnderecoPage()),
    ChildRoute('/endereco', child: (_, args) => DadosPagamentoPage()),
    ChildRoute('/endereco', child: (_, args) => PagamentoSucessoPage()),
  ];
}
