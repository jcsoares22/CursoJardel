import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reserva_salao/features/realiza_login/domain/entities/dados_login.dart';
import 'package:reserva_salao/features/realiza_login/domain/repositories/login_repositore.dart';
import 'package:reserva_salao/features/realiza_login/domain/usercases/realiza_login.dart';

import 'usecase_test.mocks.dart';

@GenerateMocks([LoginRepositore])
void main() {
  final repositore = MockLoginRepositore();
  final usecase = RealizaLogin(repositore: repositore);

  test('deve retornar um objeto dados login', () async {
    when(repositore.realizaLogin(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).thenAnswer((_) async =>
        const Right(DadosLogin(nome: 'nome do teste', token: 'nome do token')));

    const params = Params(email: 'email', password: '1234');
    final result = (await usecase(params: params)).fold((l) => l, (r) => r);
    expect(result, isA<DadosLogin>());

    verify(repositore.realizaLogin(
      email: anyNamed('email'),
      password: anyNamed('password'),
    )).called(1);

    verifyNoMoreInteractions(repositore);
  });
}
