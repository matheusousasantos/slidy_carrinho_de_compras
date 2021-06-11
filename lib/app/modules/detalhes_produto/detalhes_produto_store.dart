import 'package:mobx/mobx.dart';
import 'package:slidy_carrinho_de_compras/app/shared/stores/carrinho/carrinho_store.dart';

part 'detalhes_produto_store.g.dart';

class DetalhesProdutoStore = _DetalhesProdutoStoreBase with _$DetalhesProdutoStore;
abstract class _DetalhesProdutoStoreBase with Store {
  final CarrinhoStore _carrinhoStore;

  _DetalhesProdutoStoreBase(this._carrinhoStore);

  void adicionarProdutoNoCarrinho(produtoModel) {
    _carrinhoStore.adicionarProdutoNoCarrinho(produtoModel);
  }
}