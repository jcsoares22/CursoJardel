import 'dart:math';

main() {
  somaComPrint(5, 5);
  somaDoisNumeroQuaisquer();
}

void somaComPrint(int a, int b) {
  print(a + b);
}

void somaDoisNumeroQuaisquer() {
  int n1 = Random().nextInt(11);
  int n2 = Random().nextInt(11);
  print('N1 = ${n1}, N2 = ${n2}');
  print(n1 + n2);
}
