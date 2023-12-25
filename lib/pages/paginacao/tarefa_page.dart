import 'package:app_srh/model/tarefa.dart';
import 'package:app_srh/pages/service/repository/tarefa_repository.dart';
import 'package:flutter/material.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var descricaoController = TextEditingController();
  var tarefarepository = TarefaRepository();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Expanded(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              // limando variavel
              descricaoController.text = "";
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      title: const Text("Adicionar tarefa"),
                      content: TextField(controller: descricaoController),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancelar")),
                        TextButton(
                            onPressed: () {
                              tarefarepository.adicionart(
                                  Tarefa(descricaoController.text, false));
                              Navigator.pop(context);
                            },
                            child: const Text("Salvar")),
                      ],
                    );
                  });
            },
          ),
          body: Container(),
        ),
      ),
    );
  }
}
