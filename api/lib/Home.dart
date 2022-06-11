import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String endereco = "";
  recuperarCep() async {
    String url = 'https://viacep.com.br/ws/01001000/json/';
    http.Response respose;
    respose = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = jsonDecode(respose.body);
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    setState(() {
      endereco = logradouro + " - " + bairro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consumo de API")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          ElevatedButton(
              onPressed: () {
                recuperarCep();
              },
              child: Text("Buscar")),
          Text(endereco)
        ]),
      ),
    );
  }
}
