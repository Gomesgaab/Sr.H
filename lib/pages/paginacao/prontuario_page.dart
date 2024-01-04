import 'package:app_srh/model/prontuariomodel.dart';
import 'package:app_srh/repository/prontuario_repositori.dart';
import 'package:flutter/material.dart';

class PageProntuario extends StatefulWidget {
  const PageProntuario({super.key});

  @override
  State<PageProntuario> createState() => _PageProntuarioState();
}

class _PageProntuarioState extends State<PageProntuario> {
  var prontuarioRepository = ProntuarioRepositori();
  var _prontuario = const <ProntuarioModel>[];
  var datacontole = TextEditingController(text: "");
  DateTime? dataNacimento;
  var cnscontrol = TextEditingController();
  var nomeControle = TextEditingController();
  var sexoControle = TextEditingController();
  var fcControle = TextEditingController();
  var paControle = TextEditingController();
  var taxControle = TextEditingController();
  var rControle = TextEditingController();
  var dxControle = TextEditingController();
  var sintomasControle = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listarProntuarios();
  }

  void listarProntuarios() async {
    _prontuario = await prontuarioRepository.visualizarProntuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/fundo_home.png'), fit: BoxFit.cover)),
        child: ListView.builder(
          itemCount: _prontuario.length,
          itemBuilder: (BuildContext bc, int index) {
            var prontuario = _prontuario[index];
            return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 200, 228, 1000)),
                margin: const EdgeInsets.all(15),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(prontuario.id.toString()),
                      Text(prontuario.cns),
                      Text(prontuario.nome),
                      Text(prontuario.sexo),
                      Text(prontuario.dtNacimento.toString())
                    ],
                  ),
                ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext bc) {
                return ListView(
                  children: [
                    AlertDialog.adaptive(
                      backgroundColor: const Color.fromARGB(255, 200, 228, 232),
                      title: const Text(" prontuario"),
                      actions: [
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: cnscontrol,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 200, 228, 232))),
                            fillColor: Color.fromARGB(255, 200, 228, 232),
                            filled: true,
                            hintText: "CNS:",
                            contentPadding: EdgeInsets.only(top: 0, left: 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextField(
                            controller: nomeControle,
                            decoration:
                                const InputDecoration(hintText: "Nome "),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: const InputDecoration(
                                    hintText: "Data Nacimento"),
                                controller: datacontole,
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
                                    datacontole.text = data.toString();
                                    dataNacimento = data;
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            SizedBox(
                              width: 100,
                              child: TextField(
                                controller: sexoControle,
                                decoration:
                                    const InputDecoration(hintText: "Sexo"),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Title(
                                  color: Colors.black,
                                  child: const Text(
                                    "Triagem",
                                    style: TextStyle(fontSize: 25),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 0),
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 50,
                                child: TextField(
                                  decoration: InputDecoration(hintText: "FC:"),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              SizedBox(
                                width: 50,
                                child: TextField(
                                  decoration: InputDecoration(hintText: "PA:"),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              SizedBox(
                                width: 50,
                                child: TextField(
                                  decoration: InputDecoration(hintText: "TAx:"),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              SizedBox(
                                width: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "R:",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "DX:",
                                ),
                              ),
                            ),
                            SizedBox(width: 25),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Sintomas:",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 0,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancelar")),
                              ),
                              Expanded(
                                flex: 289,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 0,
                                child: TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      await prontuarioRepository
                                          .adicionarP(ProntuarioModel(
                                        cnscontrol.text,
                                        nomeControle.text,
                                        DateTime.parse(datacontole.text),
                                        sexoControle.text,
                                        fcControle.text,
                                        paControle.text,
                                        taxControle.text,
                                        rControle.text,
                                        dxControle.text,
                                        sexoControle.text,
                                        false,
                                      ));
                                      setState(() {});
                                    },
                                    child: const Text("Salvar")),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
