class Tarefa {
  int? id;
  final String titulo;
  DateTime dataCriacao;
  bool finalizada;

  Tarefa({
    this.id,
    required this.titulo,
    required this.dataCriacao,
    required this.finalizada,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'dataCriacao': dataCriacao.toString(),
      'finalizada': finalizada ? 1 : 0,
    };
  }
}
