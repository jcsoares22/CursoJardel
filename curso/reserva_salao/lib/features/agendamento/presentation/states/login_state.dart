sealed class loginState {}

class LoginStateStart extends loginState {}

class LoginStateLoading extends loginState {}

class LoginSatateSucess extends loginState {}

class LoginSatateError extends loginState {
  final String message;
  LoginSatateError({required this.message});
}
