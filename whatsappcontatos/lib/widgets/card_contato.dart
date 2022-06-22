import 'package:flutter/material.dart';
import 'package:kfurisqlite/widgets/visualizar_contato.dart';

class ContatoCard extends StatefulWidget {
  final String nome;
  final String telefone;
  final String imagem;

  const ContatoCard(
      {required this.nome,
      required this.telefone,
      required this.imagem,
      Key? key})
      : super(key: key);

  @override
  _ContatoCardState createState() => _ContatoCardState();
}

class _ContatoCardState extends State<ContatoCard> {
  @override
  Widget build(BuildContext context) {
    var numeroFormatado = "(" +
        widget.telefone.substring(0, 2) +
        ") " +
        widget.telefone.substring(2, 7) +
        "-" +
        widget.telefone.substring(7, 11);
    return Card(
      elevation: 0,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => VisualizarContato(
                        nome: widget.nome,
                      )));
        },
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(6.0),
            ),
            SizedBox(
              width: 60,
              height: 60,
              child: CircleAvatar(
                radius: 220,
                backgroundImage: AssetImage('assets/images/' + widget.imagem),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(6.0),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.nome,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    numeroFormatado,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8F8F8F),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
