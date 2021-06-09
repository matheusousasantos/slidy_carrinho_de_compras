
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_carrinho_de_compras/app/modules/shared/auth/auth_store.dart';

import 'loja_page.dart';
import 'loja_store.dart';
import 'repositories/loja_repository.dart';

class LojaModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LojaRepository(Dio())),
    Bind((i) => LojaStore(i.get<LojaRepository>(), i.get<AuthStore>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => LojaPage(title: "Loja"), transition: TransitionType.fadeIn),
  ];
}
