import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidy_carrinho_de_compras/app/modules/pagamento/models/pagamento_model.dart';

import '../../pagamento_store.dart';

part 'dados_endereco_controller.g.dart';

class DadosEnderecoController = _DadosEnderecoControllerBase
    with _$DadosEnderecoController;

abstract class _DadosEnderecoControllerBase extends Disposable with Store {
  final PagamentoStore _pagamentoStore;

  _DadosEnderecoControllerBase(this._pagamentoStore);

  @computed
  PagamentoModel get model => _pagamentoStore.pagamento;

  var ruaController = TextEditingController();
  var numeroController = TextEditingController();

  @action
  void proximo() {
    model.rua = ruaController.text;
    model.numero = numeroController.text;

    Modular.to.pushNamed("/dadosPagamento", arguments: model);
  }

  @override
  void dispose() {
    ruaController.dispose();
    numeroController.dispose();
  }
}
