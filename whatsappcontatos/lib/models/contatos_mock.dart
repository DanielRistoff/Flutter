import 'dart:ffi';

import 'package:kfurisqlite/models/contato.dart';

class ContatosMock {
  static Future<List<Contato>> listarContatos() {
    List<Contato> listContatos = [
      Contato(nome: "Hedal", telefone: "11780678313", imagem: "contato1.jpg"),
      Contato(
          nome: "Sikeokas", telefone: "11261593548", imagem: "contato2.jpg"),
      Contato(nome: "Vosia", telefone: "11198774253", imagem: "contato3.jpg"),
      Contato(nome: "Elbukas", telefone: "71863132694", imagem: "contato4.jpg"),
      Contato(
          nome: "Gilzaguk", telefone: "71295979651", imagem: "contato5.jpg"),
      Contato(
          nome: "Thurinmeorond",
          telefone: "65450555311",
          imagem: "contato6.jpg"),
      Contato(nome: "Beblima", telefone: "65278093716", imagem: "contato7.jpg"),
      Contato(
          nome: "Doykoyvo", telefone: "65238795510", imagem: "contato8.jpg"),
      Contato(nome: "Morripe", telefone: "92858510978", imagem: "contato9.jpg"),
      Contato(nome: "Zedebu", telefone: "92351418104", imagem: "contato10.jpg"),
      Contato(nome: "Kemapi", telefone: "92191589893", imagem: "contato11.jpg"),
      Contato(
          nome: "Wyohuern", telefone: "88443997052", imagem: "contato12.jpg"),
      Contato(nome: "Xoami", telefone: "88209102414", imagem: "contato13.jpg"),
      Contato(
          nome: "Nuvyesal", telefone: "88856788154", imagem: "contato14.jpg"),
      Contato(nome: "Pewal", telefone: "63762969414", imagem: "contato15.jpg"),
    ];
    return Future.value(listContatos);
  }
}
