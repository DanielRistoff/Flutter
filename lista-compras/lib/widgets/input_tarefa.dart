import 'package:flutter/material.dart';
import 'package:kfurisqlite/screens/home.dart';
import '../models/tarefas.dart';

// ignore: must_be_immutable
class TarefaInput extends StatefulWidget {
  final Function criaTarefa;
  final Function verificarExisteTarefaPorNome;
  var informacoes = '';

  TarefaInput(
      {required this.criaTarefa,
      required this.verificarExisteTarefaPorNome,
      Key? key})
      : super(key: key);

  @override
  _TarefaInputState createState() => _TarefaInputState();
}

class _TarefaInputState extends State<TarefaInput> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    final ButtonStyle styleBotaoVoltar = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), primary: Colors.red);

    return Center(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 20),
          TextFormField(
            controller: textController,
            decoration: const InputDecoration(
              icon: Icon(Icons.add_circle),
              labelText: 'Item *',
            ),
          ),
          const SizedBox(height: 20),
          Text(widget.informacoes),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: 80),
              ElevatedButton(
                style: style,
                onPressed: () async {
                  var inf = '';
                  if (textController.text != '') {
                    var existeItem = await widget
                        .verificarExisteTarefaPorNome(textController.text);
                    if (!existeItem) {
                      var tarefa = Tarefa(
                          titulo: textController.text,
                          dataCriacao: DateTime.now(),
                          finalizada: false);
                      widget.criaTarefa(tarefa);
                      inf = 'Item ' +
                          textController.text +
                          ' adicionado com sucesso';
                    } else {
                      inf = 'Esse item já exite na lista';
                    }
                  } else {
                    inf = 'Valor do item inválido';
                  }
                  setState(() {
                    widget.informacoes = inf;
                  });
                },
                child: const Text('Adicionar'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: styleBotaoVoltar,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Homepage()));
                },
                child: const Text('Voltar'),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
