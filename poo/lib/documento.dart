class Documento {
  final String? nome;
  final DateTime? DataVencimento;
  final double? valor;
  final double? valorpgo;
  final DateTime? dataPagamento;

  Documento({
    this.nome,
    this.DataVencimento,
    this.valor,
    this.valorpgo = 100,
    this.dataPagamento = null,
  });

  Documento pagar(double valor) {
    return Documento();
  }
}
