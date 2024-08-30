import 'package:dartz/dartz.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/realiza_login/data/datasouces/login_datasource.dart';
import 'package:reserva_salao/features/realiza_login/data/models/dados_login_model.dart';
import 'package:reserva_salao/features/realiza_login/domain/entities/dados_login.dart';
import 'package:reserva_salao/features/realiza_login/domain/repositories/login_repositore.dart';

class LoginRepositoryImpl implements LoginRepositore {
  final LoginDatasouce datasouce;

  LoginRepositoryImpl({
    required this.datasouce,
  });
  @override
  Future<Either<RepositoryFailure, DadosLogin>> realizaLogin(
      {required String email, required String password}) async {
    try {
      final DadosLoginModel =
          await datasouce.realizarLogin(email: email, password: password);

      return Right(DadosLoginModel);
    } catch (e) {
      return Left(RepositoryFailure(message: e.toString()));
    }
  }
}
