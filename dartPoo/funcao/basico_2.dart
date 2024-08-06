import 'dart:math';

void main() {
  int resultado = soma(3, 5);
  print(resultado);
  int aleatorios = somarNumerosAleatorios();
  print('os numeros aleatorios somados são $aleatorios');
}

int soma(int a, int b) {
  return a + b;
}

int somarNumerosAleatorios() {
  int a = Random().nextInt(10);
  int b = Random().nextInt(10);
  return a + b;
}
