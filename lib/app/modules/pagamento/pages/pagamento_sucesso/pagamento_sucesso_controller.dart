import 'package:mobx/mobx.dart';
import 'package:slidy_carrinho_de_compras/app/modules/pagamento/models/pagamento_model.dart';

import '../../pagamento_store.dart';

part 'pagamento_sucesso_controller.g.dart';

class PagamentoSucessoController = _PagamentoSucessoControllerBase
    with _$PagamentoSucessoController;

abstract class _PagamentoSucessoControllerBase with Store {
  final PagamentoStore _pagamentoStore;

  _PagamentoSucessoControllerBase(this._pagamentoStore);

  @computed
  PagamentoModel get model => _pagamentoStore.pagamento;
}
