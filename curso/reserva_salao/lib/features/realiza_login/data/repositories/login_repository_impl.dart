import 'package:dartz/dartz.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/realiza_login/domain/entities/dados_login.dart';
import 'package:reserva_salao/features/realiza_login/domain/repositories/login_repositore.dart';

class LoginRepositoryImpl implements LoginRepositore {
  @override
  Future<Either<Failure, DadosLogin>> realizaLogin({required String email, required String password}) {
    throw UnimplementedError();
  }

  



}
