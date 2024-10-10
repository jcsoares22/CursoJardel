import 'package:flutter/material.dart';

class LoginRodapeWidget extends StatelessWidget {
  const LoginRodapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: TextButton(onPressed: () {}, child: const Text('Esqueci a senha')),
    );
  }
}
