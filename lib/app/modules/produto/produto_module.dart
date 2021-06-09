import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'produto_page.dart';
import 'produto_store.dart';
import 'repositories/produto_repository.dart';

class ProdutoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ProdutoRepository(Dio())),
    Bind(
      (i) => ProdutoStore(i.get<ProdutoRepository>(),i.args?.params["idLoja"]),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/:nomeLoja/:idLoja",
      child: (_, args) => ProdutoPage(
        nomeDaLoja: args.params["nomeLoja"],
        id: args.params["idLoja"],
      ),
    ),
  ];
}
