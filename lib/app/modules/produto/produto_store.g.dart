// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoStore on _ProdutoStoreBase, Store {
  final _$produtosAtom = Atom(name: '_ProdutoStoreBase.produtos');

  @override
  ObservableList<ProdutoModel> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(ObservableList<ProdutoModel> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_ProdutoStoreBase.init');

  @override
  Future<dynamic> init(int idLoja) {
    return _$initAsyncAction.run(() => super.init(idLoja));
  }

  @override
  String toString() {
    return '''
produtos: ${produtos}
    ''';
  }
}
