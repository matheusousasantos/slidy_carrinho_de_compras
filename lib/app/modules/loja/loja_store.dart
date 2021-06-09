import 'package:mobx/mobx.dart';
import 'package:slidy_carrinho_de_compras/app/shared/stores/auth/auth_store.dart';

import 'models/loja_model.dart';
import 'repositories/loja_repository.dart';

part 'loja_store.g.dart';

class LojaStore = _LojaStoreBase with _$LojaStore;

abstract class _LojaStoreBase with Store {
  final AuthStore _authStore;
  final LojaRepository repository;

  _LojaStoreBase(this.repository, this._authStore) {
    init();
  }

  @computed
  bool get isLogged => _authStore.isLogged;

  @observable
  ObservableList<LojaModel> lojas = new ObservableList<LojaModel>();

  @action
  Future init() async {
    lojas = (await repository.obterLojas()).asObservable();
  }
}
