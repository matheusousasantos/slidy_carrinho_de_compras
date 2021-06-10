import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidy_carrinho_de_compras/app/shared/models/usuario/usuario_model.dart';
import 'package:slidy_carrinho_de_compras/app/shared/stores/auth/auth_store.dart';

part 'session_store.g.dart';

class SessionStore = _SessionStoreBase with _$SessionStore;

abstract class _SessionStoreBase with Store {
  final AuthStore _authStore;
  _SessionStoreBase(this._authStore);

  var emailController = TextEditingController();
  var senhaController = TextEditingController();

  @action
  void entrar() {
    if (emailController.text != "" && senhaController.text != "") {
      UsuarioModel usuarioModel = new UsuarioModel();

      usuarioModel.email = emailController.text;
      usuarioModel.senha = senhaController.text;

      _authStore.setUsuario(usuarioModel);
      Modular.to.pushReplacementNamed("/");
    } else {
      print('Erro ao tentar logar');
    }
  }

  void dispose() {
    emailController.dispose();
    senhaController.dispose();
  }
}
