import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './tarefas.dart';

class BDConnection {
  Database? _bd;
  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = 'tarefas.db';
    final origem = join(dbpath, dbname);

    _bd = await openDatabase(origem, version: 1, onCreate: _criarBD);

    return _bd!;
  }

  Future<void> _criarBD(Database bd, int version) async {
    await bd.execute('''
      CREATE TABLE tarefa(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT,
        dataCriacao TEXT,
        finalizada INTEGER
      )
    ''');
  }

  Future<void> criaTarefa(Tarefa tarefa) async {
    final bd = await database;
    await bd.insert(
      'tarefa',
      tarefa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deletaTarefa(Tarefa tarefa) async {
    final bd = await database;
    await bd.delete(
      'tarefa',
      where: 'id == ?',
      whereArgs: [tarefa.id],
    );
  }

  Future<List<Tarefa>> listaTarefa() async {
    final bd = await database;
    List<Map<String, dynamic>> items = await bd.query(
      'tarefa',
      orderBy: 'id DESC',
    );

    return List.generate(
      items.length,
      (i) => Tarefa(
        id: items[i]['id'],
        titulo: items[i]['titulo'],
        dataCriacao: DateTime.parse(items[i]['dataCriacao']),
        finalizada: items[i]['finalizada'] == 1 ? true : false,
      ),
    );
  }

  Future<bool> verificarExisteTarefaPorNome(String nomeTarefa) async {
    bool existeTarefa = false;
    final bd = await database;
    List<Map<String, dynamic>> items = await bd.query(
      'tarefa',
      where: " titulo = ?",
      whereArgs: [nomeTarefa],
    );

    if (items.isNotEmpty) {
      existeTarefa = true;
    }
    return existeTarefa;
  }
}
