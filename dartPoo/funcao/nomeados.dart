void main(List<String> args) {
  saudarPessoa('joão', 33);

  saudarPessoaNomeado(idade: 33, nome: 'Joqauim');

  imprimirData();
  imprimirData(ano: 2022, dia: 15, mes: 05);
}

saudarPessoa(String nome, int idade) {
  print("Olá, $nome! Você tem $idade anos.");
}

saudarPessoaNomeado({required String nome, required int idade}) {
  print("Olá, ${nome}! Você tem ${idade} anos.");
}

imprimirData({int dia = 1, int mes = 1, int ano = 1970}) {
  print('$dia/$mes/$ano');
}
