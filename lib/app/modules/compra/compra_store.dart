import 'package:mobx/mobx.dart';

part 'compra_store.g.dart';

class CompraStore = _CompraStoreBase with _$CompraStore;
abstract class _CompraStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}