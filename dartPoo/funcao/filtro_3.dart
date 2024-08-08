List<E> filtrar<E>(List<E> lista, bool Function(E) fn) {
  List<E> lisaFiltrada = [];
  for (E elemento in lista) {
    if (fn(elemento)) {
      lisaFiltrada.add(elemento);
    }
  }
  return lisaFiltrada;
}

void main(List<String> args) {
  var notas = [8.2, 7.1, 6.2, 4.4, 3.9, 8.8, 9.1, 5.1];

  var boasNotasFn = (double nota) => nota >= 7.5;

  var somenteNotasBoas = filtrar(notas, boasNotasFn);
  print(somenteNotasBoas);

  var nomes = ['Ana', 'Bia', 'Rebeca', 'Gui', 'João'];

  var nomesGrandesFn = (String nome) => nome.length >= 5;

  print(filtrar(nomes, nomesGrandesFn));
}
