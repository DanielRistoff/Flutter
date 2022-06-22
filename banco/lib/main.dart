import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  recuperaBancoDados() async {
    var caminhoBanco = await getDatabasesPath();
    var localBanco = join(caminhoBanco, "bd.db");

    var bd = await openDatabase(localBanco, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE usuario (id INTEGER PRIMART KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
      db.execute(sql);
    });
    print("Aberto: " + bd.isOpen.toString());
    return bd;
  }

  salvar() async {
    Database bd = await recuperaBancoDados();
    Map<String, dynamic> dadosUsuario = {"nome": "Daniel", "idade": 28};
    int id = await bd.insert("usuario", dadosUsuario);
    print("Salvo" + id.toString());
  }

  listaUsuario() async {
    Database bd = await recuperaBancoDados();
    String consultaIdade = "SELECT * FROM usuario WHERE idade = 28";
    String listaUsuarios = "SELECT * FROM usuario";

    List usuarios = await bd.rawQuery(listaUsuarios);
    for (var usuario in usuarios) {
      print("id: " +
          usuario['id'].toString() +
          " nome: " +
          usuario['nome'] +
          " idade: " +
          usuario['idade'].toString());
    }
  }

  excluirUsario(int id) async {
    Database bd = await recuperaBancoDados();
    int retorno = await bd.delete("usuario", where: "id=?", whereArgs: [id]);
    print("excluido:" + retorno.toString());
  }

  atualizarUsuario(int id) async {
    Database bd = await recuperaBancoDados();
    Map<String, dynamic> dadosUsuario = {"nome": "teste", "idade": 2};
    int retorno = await bd
        .update("usuario", dadosUsuario, where: "id=?", whereArgs: [id]);
    print("Atualizado: " + retorno.toString());
  }

  @override
  Widget build(BuildContext context) {
    salvar();
    listaUsuario();
    return Container();
  }
}
