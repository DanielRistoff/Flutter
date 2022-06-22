import 'package:path/path.dart';
import './tarefas.dart';
import 'package:mysql1/mysql1.dart';

class BDConnection {
  Future<MySqlConnection> database() async {
    final bd = await MySqlConnection.connect(ConnectionSettings(
        host: '10.0.2.2',
        port: 3306,
        user: 'root',
        db: 'listacompras',
        password: '123'));

    _criarBD(bd);

    return bd;
  }

  void _closeConnection(MySqlConnection connection) {
    connection.close();
  }

  Future<void> _criarBD(MySqlConnection bd) async {
    await bd.query('''
       CREATE TABLE IF NOT EXISTS tarefa(
        id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
        titulo varchar(40),
        dataCriacao varchar(40),
        finalizada BOOLEAN
      )
    ''');
  }

  Future<void> criaTarefa(Tarefa tarefa) async {
    final bd = await database();
    if (tarefa.id != null) {
      await bd.query('UPDATE tarefa SET finalizada = ? WHERE id = ?',
          [tarefa.finalizada, tarefa.id]);
    } else {
      await bd.query(
          'INSERT INTO tarefa (titulo, dataCriacao, finalizada) VALUES (?, ?, ?)',
          [tarefa.titulo, tarefa.dataCriacao.toString(), tarefa.finalizada]);
    }
    _closeConnection(bd);
  }

  Future<void> deletaTarefa(Tarefa tarefa) async {
    final bd = await database();
    await bd.query('DELETE FROM tarefa WHERE id = ?', [tarefa.id]);
    _closeConnection(bd);
  }

  Future<List<Tarefa>> listaTarefa() async {
    final bd = await database();
    var items = await bd.query(
        'SELECT id, titulo, dataCriacao, finalizada  FROM tarefa ORDER BY titulo ASC');

    List<Tarefa> listTarefas = [];

    for (var tarefa in items) {
      listTarefas.add(Tarefa(
          id: tarefa[0],
          titulo: tarefa[1],
          dataCriacao: DateTime.parse(tarefa[2]),
          finalizada: tarefa[3] == 0 ? false : true));
    }
    _closeConnection(bd);
    return Future<List<Tarefa>>.value(listTarefas);
  }

  Future<bool> verificarExisteTarefaPorNome(String nomeTarefa) async {
    bool existeTarefa = false;
    final bd = await database();

    var items = await bd
        .query('SELECT titulo  FROM tarefa WHERE titulo = ?', [nomeTarefa]);

    if (items.isNotEmpty) {
      existeTarefa = true;
    }
    _closeConnection(bd);
    return existeTarefa;
  }
}
