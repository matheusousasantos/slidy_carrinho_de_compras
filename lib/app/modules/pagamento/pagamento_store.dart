import 'package:mobx/mobx.dart';
import 'package:slidy_carrinho_de_compras/app/shared/stores/auth/auth_store.dart';

import 'models/pagamento_model.dart';
part 'pagamento_store.g.dart';

class PagamentoStore = _PagamentoStoreBase with _$PagamentoStore;

abstract class _PagamentoStoreBase with Store {
  final AuthStore _authStore;

  _PagamentoStoreBase(this._authStore) {
    pagamento = PagamentoModel()..nome = _authStore.usuario.email;
  }

  @observable
  PagamentoModel pagamento = new PagamentoModel();
}
