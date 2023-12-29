import 'package:app_srh/pages/paginacao/card_page.dart';
import 'package:app_srh/repository/linguagens_repository.dart';
import 'package:app_srh/repository/nivel_repository.dart';
import 'package:flutter/material.dart';

class DadosPaciente extends StatefulWidget {
  const DadosPaciente({super.key});

  @override
  State<DadosPaciente> createState() => _DadosPacienteState();
}

class _DadosPacienteState extends State<DadosPaciente> {
  //crirando uma variavel de controle de nome
  var name = TextEditingController(text: "");
  //crirando uma variavel de controle de Date
  var crontroleDate = TextEditingController(text: "");
  DateTime? dataNacimento;
  var nivelRepository = NivelRepository();
  var niveis = [];
  // criando variavel vazia para receber valor da RadioListTile
  var nivelSelecionado = "";
  //variavel para celeção de linguagens
  var linguagenRepository = LinguagensRepository();
  var linguagemSelect = [];
  var linguagens = [];
  //variavel de nivel de dor
  double nivelDeDor = 0;
  //variavel de dias com dor
  int quantosDias = 0;

  bool salvando = false;

  @override
  void initState() {
    linguagens = linguagenRepository.linguagensRepository();
    niveis = nivelRepository.retornaNivel();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnDias(int quantidadeDias) {
    var dias = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeDias; i++) {
      dias.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return dias;
  }
  //um exemplo de utilização de componente para edição de todos os dados de texto de uma vez
  /* Text returnText(String texto) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
    );
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus dados"),
      ),
      body: Container(
        color: const Color.fromRGBO(116, 155, 194, 0.5),
        child: const CardPage(),
      ),
    );
  }
}
