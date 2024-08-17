import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/core/usecase.dart';
import 'package:reserva_salao/features/realiza_login/domain/entities/dados_login.dart';
import 'package:reserva_salao/features/realiza_login/domain/repositories/login_repositore.dart';

class Params extends Equatable {
  final String email;
  final String password;
  const Params({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class RealizaLogin extends Usecase<DadosLogin, Params> {
  final LoginRepositore repositore;

  RealizaLogin({required this.repositore});

  @override
  Future<Either<Failure, DadosLogin>> call({required Params params}) async {
    var result = await repositore.realizaLogin(
        email: params.email, password: params.email);

    if (result.isRight()) {
      return result;
    }

    throw UnimplementedError;
  }
}
