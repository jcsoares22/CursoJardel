import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reserva_salao/core/widget/custom_scroll_widget.dart';
import 'package:reserva_salao/core/widget/textbox_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: CustomScrollWidget(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextboxWidget(
                  label: 'Login',
                ),
                TextboxWidget(
                  label: 'Password',
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
