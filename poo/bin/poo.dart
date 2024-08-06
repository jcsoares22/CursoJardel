
import '../lib/documento.dart';

void main(List<String> arguments) {
  var documento = Documento(nome: 'jo', DataVencimento: null, valor: null);

  documento.pagar(100);

  print(documento.valorpgo);
}
