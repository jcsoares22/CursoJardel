import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgendamentoPage extends StatefulWidget {
  const AgendamentoPage(String s, {super.key});

  @override
  State<AgendamentoPage> createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("nome"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text("Voltar"),
        ),
      ),
    );
  }
}
