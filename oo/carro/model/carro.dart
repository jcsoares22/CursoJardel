class Carro {
  final int velocidadeMaxina;
  int _velocidadeAtual = 0;

  Carro([this.velocidadeMaxina = 200]);

  int get velocidade {
    return this._velocidadeAtual;
  }

  void set velocidadeAtual(int novaVelocidade) {
    bool deltaValido = (_velocidadeAtual - novaVelocidade).abs() <= 5;
    if (deltaValido && novaVelocidade >= 0) {
      this._velocidadeAtual = novaVelocidade;
    }
  }

  int acelerar() {
    if (_velocidadeAtual + 5 >= velocidadeMaxina) {
      _velocidadeAtual = velocidadeMaxina;
    } else {
      _velocidadeAtual += 5;
    }
    return _velocidadeAtual;
  }

  int frear() {
    if (_velocidadeAtual - 5 <= 0) {
      _velocidadeAtual = 0;
    } else {
      _velocidadeAtual -= 5;
    }

    return _velocidadeAtual;
  }

  bool estaNolimite() {
    return _velocidadeAtual >= velocidadeMaxina;
  }

  bool estaParado() {
    return _velocidadeAtual == 0;
  }
}
