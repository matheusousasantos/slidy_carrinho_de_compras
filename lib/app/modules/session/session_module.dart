import 'package:slidy_carrinho_de_compras/app/modules/session/session_page.dart';
import 'package:slidy_carrinho_de_compras/app/modules/session/session_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_carrinho_de_compras/app/shared/stores/auth/auth_store.dart';

class SessionModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SessionStore(i.get<AuthStore>())),

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SessionPage()),
  ];
}
