import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:reserva_salao/features/realiza_login/data/models/error_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const ErroComSucesso = ErrorModel(
    title: "RLH01 - Email inválido!",
    status: 400,
  );
  test('error model ...', () async {
    var jsonMap = json.decode(fixture('error_model.json'));
    final result = ErrorModel.fromjson(jsonMap);
    expect(result, ErroComSucesso);
  });
}
