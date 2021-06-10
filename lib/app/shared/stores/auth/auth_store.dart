import 'package:mobx/mobx.dart';
import 'package:slidy_carrinho_de_compras/app/shared/models/usuario/usuario_model.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  UsuarioModel usuario = UsuarioModel();

  @action
  void setUsuario(UsuarioModel value) => usuario = value;

  @computed
  bool get isLogged => usuario.email != "" && usuario.senha != "";
}
