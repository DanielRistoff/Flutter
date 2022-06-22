import 'package:flutter/material.dart';
import 'package:kfurisqlite/widgets/lista_contatos.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos WhatsApp'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: const [
          ListaContatos(),
        ],
      ),
    );
  }
}
