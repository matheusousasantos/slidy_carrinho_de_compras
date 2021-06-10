import 'package:mobx/mobx.dart';
import 'package:slidy_carrinho_de_compras/app/shared/stores/auth/auth_store.dart';

import 'models/produto_model.dart';
import 'repositories/produto_repository.dart';

part 'produto_store.g.dart';

class ProdutoStore = _ProdutoStoreBase with _$ProdutoStore;
abstract class _ProdutoStoreBase with Store {
  final AuthStore _authStore;
  final ProdutoRepository repository;

  _ProdutoStoreBase(this.repository, String idLoja, this._authStore) {
    init(int.parse(idLoja));
  }

  @computed
  bool get isLogged => _authStore.isLogged;

  @observable
  ObservableList<ProdutoModel> produtos = new ObservableList<ProdutoModel>();

  @action
  Future init(int idLoja) async {
    produtos = (await repository.obterProdutos(idLoja)).asObservable();
  }
 
}