import 'package:app_srh/repository/linguagens_repository.dart';
import 'package:app_srh/repository/nivel_repository.dart';
import 'package:app_srh/shared/componentes/text/textoCard_custon.dart';
import 'package:flutter/material.dart';

class DadosPage extends StatefulWidget {
  const DadosPage({super.key});

  @override
  State<DadosPage> createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
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
    // TODO: implement initState
    linguagens = linguagenRepository.linguagensRepository();
    niveis = nivelRepository.retornaNivel();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnDias(int quantidadeDias) {
    var dias = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeDias; i++) {
      dias.add(DropdownMenuItem(
        child: Text(i.toString()),
        value: i,
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
      body: Padding(
        // editando posição
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        //utilizando listview para rolagem de tela, sendo assim não ocorrera o erro de indentificação de tamanho de tela.
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const Textedition(
                    texto: "Nome: ",
                  ),
                  // iniciando uma entrada de texto
                  TextField(
                    controller: name,
                  ),
                  const Textedition(
                    texto: "Data: ",
                  ),
                  TextField(
                    controller: crontroleDate,
                    //readOnly usado para dizer se o campo e de leitura ou editavel
                    readOnly: true,
                    onTap: () async {
                      //Seleção de data
                      var data = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900, 1, 1),
                          initialDate: DateTime(2000, 1, 1),
                          lastDate: DateTime(2023, 12, 31));
                      if (data != null) {
                        crontroleDate.text = data.toString();
                        dataNacimento = data;
                      }
                    },
                  ),
                  const Textedition(texto: "Niveil: "),
                  Column(
                      //.map ele pega uma lista de valores e retorna essa lista com novos valores (nivel)
                      children: niveis
                          // lista niveis recebe novo valor de nivel
                          .map((nivel) => RadioListTile(
                              title: Text(nivel.toString()),
                              value: nivel.toString(),
                              //groupValue define o grupo selecionado/ mostra no check
                              groupValue: nivelSelecionado,
                              onChanged: (value) {
                                setState(() {
                                  nivelSelecionado = value.toString();
                                });
                              }))
                          .toList()),
                  //checkBox Linguagens
                  const Textedition(texto: "Linguagens: "),
                  Column(
                      children: linguagens
                          .map((linguagem) => CheckboxListTile(
                              title: Text(linguagem),
                              value: linguagemSelect.contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    linguagemSelect.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    linguagemSelect.remove(linguagem);
                                  });
                                }
                              }))
                          .toList()),
                  //editando nivel de dor
                  Textedition(
                      //exibindo na tela o nivel de dor do paciente(round: arredondar valor)
                      texto: "Nivel de Dor: ${nivelDeDor.round().toString()}"),
                  //arrastar barrinha
                  Slider(
                      min: 0,
                      max: 10,
                      value: nivelDeDor,
                      onChanged: (double value) {
                        setState(() {
                          nivelDeDor = value;
                        });
                      }),

                  const Textedition(texto: "Ja fáz Quantos Dias?"),
                  DropdownButton(
                      value: quantosDias,
                      //colocando setinha de drop no canto direito
                      isExpanded: true,
                      items: returnDias(7),
                      onChanged: (value) {
                        setState(() {
                          quantosDias = int.parse(value.toString());
                        });
                      }),
                  //botão de texto para salvar
                  TextButton(
                      onPressed: () {
                        // limpando variavel de carregamento
                        setState(() {
                          salvando = false;
                        });
                        if (name.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Todos os campos devem ser preenchido para continuar!")));
                          return;
                        }
                        if (dataNacimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Todos os campos devem ser preenchido para continuar!")));
                          return;
                        }
                        if (nivelSelecionado.trim() == "") {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Todos os campos devem ser preenchido para continuar!")));
                          return;
                        }
                        if (linguagemSelect.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Todos os campos devem ser preenchido para continuar!")));
                          return;
                        }
                        if (quantosDias == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Todos os campos devem ser preenchido para continuar!")));
                          return;
                        }
                        if (nivelDeDor == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Todos os campos devem ser preenchido para continuar!")));
                          return;
                        }
                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            salvando = false;
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Dados salvo com sucesso")));
                          });
                        });
                      },
                      child: const Text("Salvar"))
                ],
              ),
      ),
    );
  }
}
