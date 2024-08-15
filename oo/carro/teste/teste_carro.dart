import '../model/carro.dart';

void main(List<String> args) {
  var c1 = Carro();
  
  while (!c1.estaNolimite()) {
    print("A velocidade atual é ${c1.acelerar()} Km/h.");
  }

  print('O carro chegou no máximo com a velodaide ${c1.velocidade}');

  while (!c1.estaParado()) {
    print("A velocidade atual é ${c1.frear()} Km/h.");
  }

  print(' seu carro parou ${c1.velocidade}');
}
