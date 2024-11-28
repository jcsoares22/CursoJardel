import 'package:flutter/material.dart';
import 'package:reserva_salao/features/agendamento/presentation/states/login_state.dart';

class LoginController extends ValueNotifier<loginState> {
  LoginController() : super(LoginStateStart());

  void realizaLogin({required String usuario, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    value = LoginSatateSucess();
  }
}
