import 'package:mobx/mobx.dart';
import 'package:slidy_carrinho_de_compras/app/modules/produto/models/produto_model.dart';
import 'package:slidy_carrinho_de_compras/app/shared/models/carrinho_model/carrinho_model.dart';
part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStoreBase with _$CarrinhoStore;

abstract class _CarrinhoStoreBase with Store {
  var produtosNoCarrinho = ObservableList<CarrinhoModel>();

  void adicionarProdutoNoCarrinho(ProdutoModel produtoModel) {
    var index = produtosNoCarrinho
        .indexWhere((element) => element.produto.id == produtoModel.id);

    if (index >= 0) {
      produtosNoCarrinho.elementAt(index).adicionar();
    } else {
      produtosNoCarrinho.add(CarrinhoModel(produtoModel));
    }
  }

  @computed
  double get total => produtosNoCarrinho
      .map((item) =>
          double.parse(item.produto.preco.replaceAll(',', '.')) *
          item.quantidade)
      .reduce((value, element) => value + element);
}
