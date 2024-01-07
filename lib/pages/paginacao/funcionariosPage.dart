import 'package:app_srh/model/cadastroFuncionario_model.dart';
import 'package:app_srh/shared/componentes/text/textoCard_custon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FuncionarioPage extends StatefulWidget {
  const FuncionarioPage({super.key});

  @override
  State<FuncionarioPage> createState() => _FuncionarioPageState();
}

class _FuncionarioPageState extends State<FuncionarioPage> {
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/fundo_home.png'), fit: BoxFit.cover)),
        child: StreamBuilder<QuerySnapshot>(
            stream: db.collection("Funcionario").snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const CircularProgressIndicator()
                  : ListView(
                      children: snapshot.data!.docs.map((e) {
                      var funcionarios = CadastroFuncionarioModel.fromJson(
                          (e.data() as Map<String, dynamic>));
                      return Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 200, 228, 1000),
                            borderRadius: BorderRadius.circular(18)),
                        margin: const EdgeInsets.all(15),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Textedition(
                                texto: "ID:   ${funcionarios.idFuncionario}",
                              ),
                              Textedition(
                                  texto:
                                      "Nome: ${funcionarios.nome.toString()}"),
                              Textedition(
                                  texto:
                                      "Telefone:  ${funcionarios.telefone.toString()}"),
                              Textedition(
                                  texto:
                                      "Endereço:  ${funcionarios.endereco.toString()}"),
                              Textedition(
                                  texto:
                                      "Data Nacimento:  ${funcionarios.dtNacimento.toString()}"),
                              Textedition(
                                  texto:
                                      "CPF:  ${funcionarios.cPF.toString()}"),
                              Textedition(
                                  texto:
                                      "Genero:  ${funcionarios.genero.toString()}"),
                              Textedition(
                                  texto:
                                      "E-mail:  ${funcionarios.email.toString()}"),
                            ],
                          ),
                        ),
                      );
                    }).toList());
            }),
      ),
    );
  }
}
