class ProdutoModel {
  final int id;
  final String nome;
  final String preco;
  final String descricao;
  final String imagem;
  final int lojaId;

  ProdutoModel({
    required this.descricao, 
    required this.lojaId, 
    required this.id,
    required this.nome,
    required this.preco,
    required this.imagem,
  });
}
