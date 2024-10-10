import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginCabecalhowidget extends StatelessWidget {
  const LoginCabecalhowidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Text(
        'Login',
        textAlign: TextAlign.center,
      ),
    );
  }
}
