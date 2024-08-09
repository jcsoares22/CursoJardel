void main(List<String> args) {
  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Marina', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.8},
  ];

  String Function(Map) pegarApenasONome = (aluno) => aluno['nome'];
  int Function(String) quantidaDesDeLetras = (texto) => texto.length;
  double Function(Map) pegarApenasNotas = (aluno) => aluno['nota'];

  var notas = alunos.map(pegarApenasNotas);
  var nomes = alunos.map(pegarApenasONome);
  var qteDeLetras = alunos.map(pegarApenasONome).map(quantidaDesDeLetras);

  print(qteDeLetras);

  print(notas);

  print('nomes ${nomes} ');
}
