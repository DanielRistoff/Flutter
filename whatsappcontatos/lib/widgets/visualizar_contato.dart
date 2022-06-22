import 'package:flutter/material.dart';

class VisualizarContato extends StatefulWidget {
  final String nome;
  const VisualizarContato({required this.nome, Key? key}) : super(key: key);

  @override
  _VisualizarContatoState createState() => _VisualizarContatoState();
}

class _VisualizarContatoState extends State<VisualizarContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nome),
      ),
    );
  }
}
