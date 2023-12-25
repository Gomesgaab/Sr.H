import 'package:app_srh/model/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  void adicionart(Tarefa tarefa) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.add(tarefa);
  }

  void alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas
        .where((element) => element.getId() == id)
        .first
        .setConcluido(concluido);
  }

  Future<List<Tarefa>> listaTarefa() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tarefas;
  }
}
