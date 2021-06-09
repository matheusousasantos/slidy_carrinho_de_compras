import 'package:mobx/mobx.dart';
import 'package:slidy_carrinho_de_compras/app/modules/shared/models/usuario/user_model.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {

  @observable
  late UsuarioModel user;

  @action
  setUser(UsuarioModel _user) => user = _user; 
  
  @computed
  bool get isLogged => user.email != "" && user.senha != "";

}