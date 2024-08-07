import 'dart:math';

void main(List<String> args) {
  var minhaFnPar = () => print('Eita! o valor é par!');
  var minhaFnPar = () => print('Eita! o valor é par!');
}

void exeecultar(Function fnPar, Function fnImpar) {
  Random().nextInt(10) % 2 == 0 ? fnPar() : fnImpar();
}
