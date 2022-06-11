import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kfurisqlite/widgets/input_tarefa.dart';

class AdicionarTarefa extends StatelessWidget {
  final Function criaTarefa;
  final Function verificarExisteTarefaPorNome;
  const AdicionarTarefa(
      {required this.criaTarefa,
      required this.verificarExisteTarefaPorNome,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar tarefa"),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          TarefaInput(
              criaTarefa: criaTarefa,
              verificarExisteTarefaPorNome: verificarExisteTarefaPorNome)
        ],
      ),
    );
  }
}
