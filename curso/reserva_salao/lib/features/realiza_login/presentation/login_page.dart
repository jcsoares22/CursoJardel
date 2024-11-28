import 'package:flutter/material.dart';
import 'package:reserva_salao/features/agendamento/presentation/states/login_controller.dart';
import 'package:reserva_salao/features/realiza_login/presentation/widgets/login_cabecalho_widget.dart';
import 'package:reserva_salao/features/realiza_login/presentation/widgets/login_form_widget.dart';
import 'package:reserva_salao/features/realiza_login/presentation/widgets/login_rodape_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;

  @override
  void initState() {
    controller = LoginController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (BuildContext context, value, Widget? child) {
          return controller();
        });

    return const Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoginCabecalhoWidget(),
          LoginFormWidget(),
          LoginRodapeWidget(),
        ],
      )),
    );
  }
}
