void main(List<String> args) {
  juntar(2, 5);
  juntar('Bom ', 'dia!!!');

  var resultado = juntarString('Numero de PI é ', 3.145);
  print(resultado);
}

dynamic juntar(dynamic a, b) {
  print(a.toString() + b.toString());
  return a.toString() + b.toString();
}

String juntarString(dynamic a, b) {
  print(a.toString() + b.toString());
  return a.toString() + b.toString();
}
