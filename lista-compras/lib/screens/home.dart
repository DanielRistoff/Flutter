import 'package:flutter/material.dart';
import 'package:kfurisqlite/widgets/adicionar_tarefa.dart';
import '../models/db.dart';
import '../models/tarefas.dart';
import '../widgets/lista_tarefas.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var db = BDConnection();

  void criaTarefa(Tarefa tarefa) async {
    await db.criaTarefa(tarefa);
    setState(() {});
  }

  void deletaTarefa(Tarefa tarefa) async {
    await db.deletaTarefa(tarefa);
    setState(() {});
  }

  Future<bool> verificarExisteTarefaPorNome(String nomeTarefa) async {
    return await db.verificarExisteTarefaPorNome(nomeTarefa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de compras'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          ListaTarefas(criaTarefa: criaTarefa, deletaTarefa: deletaTarefa)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AdicionarTarefa(
                      criaTarefa: criaTarefa,
                      verificarExisteTarefaPorNome:
                          verificarExisteTarefaPorNome)))
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
