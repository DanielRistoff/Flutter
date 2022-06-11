import 'package:flutter/material.dart';
import '../models/db.dart';
import './card_tarefa.dart';

class ListaTarefas extends StatelessWidget {
  final Function criaTarefa;
  final Function deletaTarefa;
  final db = BDConnection();
  ListaTarefas({required this.criaTarefa, required this.deletaTarefa, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.listaTarefa(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var dados = snapshot.data ?? [];
          var tamanhoLista = dados.length;

          return tamanhoLista == 0
              ? const Center(
                  child: Text('Nenhuma tarefa ainda'),
                )
              : ListView.builder(
                  itemCount: tamanhoLista,
                  itemBuilder: (context, i) => TarefaCard(
                    id: dados[i].id,
                    titulo: dados[i].titulo,
                    dataCriacao: dados[i].dataCriacao,
                    finalizada: dados[i].finalizada,
                    criaTarefa: criaTarefa,
                    deletaTarefa: deletaTarefa,
                  ),
                );
        },
      ),
    );
  }
}
