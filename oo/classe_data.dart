class Data {
  int dia = 0;
  int mes = 0;
  int ano = 0;

  obeterDataFormatada() {
    print('$dia/$mes/$ano');
  }
}

void main(List<String> args) {
  var dataAniversario = Data();
  dataAniversario.dia = 10;
  dataAniversario.mes = 12;
  dataAniversario.ano = 2024;
  //var data =
  //  '${dataAniversario.dia}/${dataAniversario.mes}/${dataAniversario.ano}';

  //print(data);
  dataAniversario.obeterDataFormatada();
  Data datacompra = Data();
  datacompra.dia = 10;
  datacompra.mes = 12;
  datacompra.ano = 2029;
//  var dataC = '${datacompra.dia}/${datacompra.mes}/${datacompra.ano}';

  //print(dataC);
  datacompra.obeterDataFormatada();
}
