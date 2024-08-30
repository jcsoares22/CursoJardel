import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/realiza_login/data/datasouces/login_datasource.dart';
import 'package:reserva_salao/features/realiza_login/data/models/dados_login_model.dart';
import 'package:reserva_salao/features/realiza_login/data/repositories/login_repository_impl.dart';
import 'package:reserva_salao/features/realiza_login/domain/entities/dados_login.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([LoginDatasouce])
void main() {
  final datasouce = MockLoginDatasouce();
  final repository = LoginRepositoryImpl(datasouce: datasouce);

  test('deve retornar um DadosLogin', () async {
    when(datasouce.realizarLogin(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer(
      (_) async => const DadosLoginModel(
        nome: "nome",
        token: "token",
        isSuccess: false,
        isFailure: true,
      ),
    );

    final result =
        await repository.realizaLogin(email: "email", password: "password");

    expect(result.fold(id, id), isA<DadosLogin>());

    verify(datasouce.realizarLogin(
            email: anyNamed("email"), password: anyNamed("password")))
        .called(1);
  });

  test('deve retrornar um repositore caso cccccc', () async {
    when(datasouce.realizarLogin(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenThrow((_) async => Exception());

    final result =
        await repository.realizaLogin(email: "email", password: "password");

    expect(result.fold(id, id), isA<RepositoryFailure>());

    verify(datasouce.realizarLogin(
            email: anyNamed("email"), password: anyNamed("password")))
        .called(1);
  });

  verifyNoMoreInteractions(datasouce);
}
