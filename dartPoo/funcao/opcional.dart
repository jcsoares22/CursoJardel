import 'dart:math';

void main(List<String> args) {
  int n1 = numeroAleatorio(100);
  print(n1);
  int n2 = numeroAleatorio2();
  print(n2);

  imprimirData(22, 06, 2024);
  imprimirData(12,01);
  imprimirData(12);
}

int numeroAleatorio(int maximo) {
  return Random().nextInt(maximo);
}

//parametro oppcional
int numeroAleatorio2([int maximo = 10]) {
  return Random().nextInt(maximo);
}

imprimirData([int dia = 1, int mes = 1, int ano = 1970]) {
  print('$dia/$mes/$ano');
}
