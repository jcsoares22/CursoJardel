
import 'package:reserva_salao/features/realiza_login/data/models/dados_login_model.dart';

abstract class LoginDatasouce{
  Future<DadosLoginModel> realizarLogin({
    required String email,
    required String password,
  });


}