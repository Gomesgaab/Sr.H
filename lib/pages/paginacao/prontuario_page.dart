import 'package:app_srh/model/prontuariomodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageProntuario extends StatefulWidget {
  const PageProntuario({super.key});

  @override
  State<PageProntuario> createState() => _PageProntuarioState();
}

class _PageProntuarioState extends State<PageProntuario> {
  final db = FirebaseFirestore.instance;
  //var prontuarioRepository = ProntuarioRepositori();
  // var _prontuario = const <ProntuarioModel>[];
  var datacontole = TextEditingController(text: "");
  var dataNacimento = "";
  var cnscontrol = TextEditingController();
  var nomeControle = TextEditingController();
  var sexoControle = TextEditingController();
  var fcControle = TextEditingController(text: "");
  var paControle = TextEditingController();
  var taxControle = TextEditingController();
  var rControle = TextEditingController();
  var dxControle = TextEditingController();
  var sintomasControle = TextEditingController();
  var anamneseControler = TextEditingController();
  var prescricaoMedicaControler = TextEditingController();
  var prescricaoEnfermagemControler = TextEditingController();
  var horarioControler = TextEditingController();
  var anotacaoEnfermagemControler = TextEditingController();

  bool salvando = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //listarProntuarios();
  }

  /* void listarProntuarios() async {
    _prontuario = await prontuarioRepository.visualizarProntuario();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/fundo_home.png'), fit: BoxFit.cover)),
        child: StreamBuilder<QuerySnapshot>(
            stream: db.collection("Prontuario").snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const CircularProgressIndicator()
                  : ListView(
                      children: snapshot.data!.docs.map((e) {
                      var prontuario = ProntuarioModel.fromJson(
                          (e.data() as Map<String, dynamic>));
                      return Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 200, 228, 1000),
                            borderRadius: BorderRadius.circular(18)),
                        margin: const EdgeInsets.all(15),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Dismissible(
                              onDismissed:
                                  (DismissDirection dismissDirectio) async {},
                              key: Key(e.id),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(prontuario.cns),
                                  Text(prontuario.nome),
                                  Row(
                                    children: [
                                      Text(prontuario.dtNacimento.toString()),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(prontuario.sexo),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(prontuario.fc!),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(prontuario.pa!),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(prontuario.tax!),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(prontuario.r!),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(prontuario.dx!),
                                    ],
                                  ),
                                  Text(prontuario.sintomas!),
                                ],
                              )),
                        ),
                      );
                    }).toList());
            }),
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
                                    dataNacimento = data.timeZoneName;
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
                          child: Row(
                            children: [
                              SizedBox(
                                width: 50,
                                child: TextField(
                                  controller: fcControle,
                                  decoration:
                                      const InputDecoration(hintText: "FC:"),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              SizedBox(
                                width: 50,
                                child: TextField(
                                  controller: paControle,
                                  decoration:
                                      const InputDecoration(hintText: "PA:"),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              SizedBox(
                                width: 50,
                                child: TextField(
                                  controller: taxControle,
                                  decoration:
                                      const InputDecoration(hintText: "TAx:"),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              SizedBox(
                                width: 50,
                                child: TextField(
                                  controller: rControle,
                                  decoration: const InputDecoration(
                                    hintText: "R:",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextField(
                                controller: dxControle,
                                decoration: const InputDecoration(
                                  hintText: "DX:",
                                ),
                              ),
                            ),
                            const SizedBox(width: 25),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: sintomasControle,
                                decoration: const InputDecoration(
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
                                      //fechando tela
                                      Navigator.pop(context);
                                      //coletando e enviando dados ao bd
                                      var prontuario = ProntuarioModel(
                                          cns: cnscontrol.text,
                                          nome: nomeControle.text,
                                          dtNacimento:
                                              DateTime.parse(datacontole.text),
                                          sexo: sexoControle.text,
                                          fc: fcControle.text,
                                          pa: paControle.text,
                                          tax: taxControle.text,
                                          r: rControle.text,
                                          dx: dxControle.text,
                                          sintomas: sintomasControle.text,
                                          anamnese: anamneseControler.text,
                                          prescricaoMedica:
                                              prescricaoMedicaControler.text,
                                          prescricaoEnfermagem:
                                              prescricaoEnfermagemControler
                                                  .text,
                                          horario: horarioControler.text,
                                          anotacaoEnfermagem:
                                              anotacaoEnfermagemControler.text,
                                          salvar: false);
                                      await db
                                          .collection("Prontuario")
                                          .add(prontuario.toJson());
                                      //limpando variaveis

                                      cnscontrol.text = "";
                                      nomeControle.text = "";
                                      sexoControle.text = "";
                                      datacontole.text = "";
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
