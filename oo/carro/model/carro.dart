class Carro {
  final int velocidadeMaxina;
  int velocidadeAtual = 0;

  Carro([this.velocidadeMaxina = 200]);

  int acelerar() {
    if (velocidadeAtual + 5 >= velocidadeMaxina) {
      velocidadeAtual = velocidadeMaxina;
    } else {
      velocidadeAtual += 5;
    }
    return velocidadeAtual;
  }

  int frear() {
    if (velocidadeAtual - 5 <= 0) {
      velocidadeAtual = 0;
    } else {
      velocidadeAtual -= 5;
    }

    return velocidadeAtual;
  }

  bool estaNolimite() {
    return velocidadeAtual >= velocidadeMaxina;
  }

  bool estaParado() {
    return velocidadeAtual == 0;
  }
}
