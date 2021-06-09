import 'package:mobx/mobx.dart';
import 'package:slidy_carrinho_de_compras/app/shared/models/usuario/user_model.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  UsuarioModel usuario = new UsuarioModel();

  @action
  setUser(UsuarioModel value) => usuario = value;

  @computed
  bool get isLogged => usuario.email != "" && usuario.senha != "";
}
