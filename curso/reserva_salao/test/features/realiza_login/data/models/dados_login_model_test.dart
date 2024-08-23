import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reserva_salao/features/realiza_login/data/models/dados_login_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const dadosloginModelSucesso = DadosLoginModel(
    nome: "Jardel Sobrinho",
    token:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEiLCJlbWFpbCI6ImphcmRlbHNvYnJpbmhvQGdtYWlsLmNvbSIsImV4cCI6MTcyNDM3MDY5OCwiaXNzIjoiQ3Vyc29GbHV0dGVyIiwiYXVkIjoiQ3Vyc29GbHV0dGVyIn0.0hcoEVR3jNzA4lSZGB_4IdOM10M6xIgWTUChX_TqqMA",
    isSuccess: true,
    isFailure: false,
  );

  test('Deve retornar um login DadosLoginModela valido', () async {
    var jsonMap = json.decode(fixture('dados_login_model.json'));
    final result = DadosLoginModel.fromjson(jsonMap);
    expect(result, dadosloginModelSucesso);
  });
}
