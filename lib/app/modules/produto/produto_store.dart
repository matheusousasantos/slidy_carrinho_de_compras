import 'package:mobx/mobx.dart';

import 'models/produto_model.dart';
import 'repositories/produto_repository.dart';

part 'produto_store.g.dart';

class ProdutoStore = _ProdutoStoreBase with _$ProdutoStore;
abstract class _ProdutoStoreBase with Store {

  final ProdutoRepository repository;

  _ProdutoStoreBase(this.repository, String idLoja) {
    init(int.parse(idLoja));
  }

  @observable
  ObservableList<ProdutoModel> produtos = new ObservableList<ProdutoModel>();

  @action
  Future init(int idLoja) async {
    produtos = (await repository.obterProdutos(idLoja)).asObservable();
  }
 
}