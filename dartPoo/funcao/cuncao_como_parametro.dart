import 'dart:math';

void main(List<String> args) {
  var minhaFnPar = () => print('Eita! o valor é par!');
  var minhaImpar = () => print('Legal! O valor é ìmpar!');

  execultar(minhaFnPar, minhaImpar);
}

void execultar(Function fnPar, Function fnImpar) {
  var valorSorteado = Random().nextInt(10);
  print(valorSorteado);
  valorSorteado % 2 == 0 ? fnPar() : fnImpar();
}
