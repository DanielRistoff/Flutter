import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/tarefas.dart';

class TarefaCard extends StatefulWidget {
  final int id;
  final String titulo;
  final DateTime dataCriacao;
  bool finalizada;
  final Function criaTarefa;
  final Function deletaTarefa;
  TarefaCard(
      {required this.id,
      required this.titulo,
      required this.dataCriacao,
      required this.finalizada,
      required this.criaTarefa,
      required this.deletaTarefa,
      Key? key})
      : super(key: key);

  @override
  _TarefaCardState createState() => _TarefaCardState();
}

class _TarefaCardState extends State<TarefaCard> {
  @override
  Widget build(BuildContext context) {
    var outraTarefa = Tarefa(
        id: widget.id,
        titulo: widget.titulo,
        dataCriacao: widget.dataCriacao,
        finalizada: widget.finalizada);

    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Checkbox(
              value: widget.finalizada,
              onChanged: (bool? value) {
                setState(() {
                  widget.finalizada = value!;
                });
                outraTarefa.finalizada = value!;
                widget.criaTarefa(outraTarefa);
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titulo,
                  style: widget.finalizada
                      ? const TextStyle(
                          fontSize: 18, decoration: TextDecoration.lineThrough)
                      : const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              widget.deletaTarefa(outraTarefa);
            },
            icon: const Icon(
              Icons.delete,
              color: Color.fromARGB(255, 195, 48, 38),
            ),
          ),
        ],
      ),
    );
  }
}
