class Tarefa {

  // Atributos:
  String nome;
  DateTime data;
  bool concluida;

  // Construtor:
  Tarefa(String nome) {
    this.nome = nome;
    data = DateTime.now();
    concluida = false;
  }
}