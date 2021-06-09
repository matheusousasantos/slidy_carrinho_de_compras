import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_carrinho_de_compras/app/modules/shared/models/stores/auth/auth_store.dart';

import 'auth_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
  ];
}
