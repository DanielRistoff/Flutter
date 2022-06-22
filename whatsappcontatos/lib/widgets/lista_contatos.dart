import 'package:flutter/material.dart';
import 'package:kfurisqlite/widgets/card_contato.dart';
import 'package:kfurisqlite/models/contatos_mock.dart';

class ListaContatos extends StatelessWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: ContatosMock.listarContatos(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var dados = snapshot.data ?? [];
          var tamanhoLista = dados.length;

          return tamanhoLista == 0
              ? const Center(
                  child: Text('Nenhum contato está disponível na agenda'),
                )
              : ListView.builder(
                  itemCount: tamanhoLista,
                  itemBuilder: (context, i) => ContatoCard(
                    nome: dados[i].nome,
                    telefone: dados[i].telefone,
                    imagem: dados[i].imagem,
                  ),
                );
        },
      ),
    );
  }
}
