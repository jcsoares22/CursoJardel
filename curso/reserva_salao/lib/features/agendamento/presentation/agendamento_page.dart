import 'package:flutter/material.dart';
<<<<<<< HEAD

class AgendamentoPage extends StatefulWidget {
  const AgendamentoPage({super.key});
=======
import 'package:go_router/go_router.dart';
import 'package:reserva_salao/core/routes.dart';

class AgendamentoPage extends StatefulWidget {
  final String nome;
  const AgendamentoPage({super.key, required this.nome});
>>>>>>> 44a29c4b38817a0a43d8096afe4da5dd4ff005f8

  @override
  State<AgendamentoPage> createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: Text('data')),
=======
      appBar: AppBar(
        title: Text(widget.nome),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text("Voltar"),
        ),
>>>>>>> 44a29c4b38817a0a43d8096afe4da5dd4ff005f8
      ),
    );
  }
}
