void main(List<String> args) {
  var adicao = (int a, int b) {
    return a + b;
  };
  print(adicao(5, 9));

  var subtracao = (int a, int b) => a - b;
  var multificacao = (int a, int b) => a * b;
  var divisao = (int a, int b) => a / b;

  print(subtracao(9, 2));
  print(multificacao(9, 2));
  print(divisao(9, 2));
}
