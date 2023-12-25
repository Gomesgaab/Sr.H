import 'package:app_srh/pages/Logn_Cadastro/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  //Shared
  late SharedPreferences storage;
  //crirando uma variavel de controle de nome
  TextEditingController nomeControler = TextEditingController();
  //crirando uma variavel de controle de email
  TextEditingController emailControler = TextEditingController();
  TextEditingController emailConfirmControler = TextEditingController();
  //crirando uma variavel de controle de cpf
  TextEditingController cpfControler = TextEditingController();
  //crirando uma variavel de controle de telefone
  TextEditingController telefoneControler = TextEditingController();

  //um exemplo de utilização de componente para edição de todos os dados de texto de uma vez
  /* Text returnText(String texto) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
    );
  } */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 188, 218, 232),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 188, 218, 232),
            actions: [
              Image.asset(
                'asset/Logo.png',
                height: 70,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Title(
                      color: Colors.black,
                      child: const Text(
                        "Sr.H",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.justify,
                      ))),
            ],
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 60),
          alignment: Alignment.center,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: TextField(
                  controller: nomeControler,
                  decoration: const InputDecoration(
                      hintText: "Nome:", icon: Icon(Icons.person_2)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: TextField(
                  controller: telefoneControler,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      hintText: "Telefone:", icon: Icon(Icons.phone)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: TextField(
                  controller: emailControler,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "Email:", icon: Icon(Icons.email)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: TextField(
                  controller: emailConfirmControler,
                  decoration: const InputDecoration(
                      hintText: "Email:", icon: Icon(Icons.email)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: TextField(
                  controller: cpfControler,
                  decoration: const InputDecoration(
                      hintText: "CPF:", icon: Icon(Icons.crop_free)),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => const Color.fromARGB(
                                        255, 176, 215, 233))),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text(
                              "Cancelar",
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                      //espaçamento entre os botões finalizar e cancelar
                      Expanded(child: Container()),
                      Expanded(
                          flex: 1,
                          child: TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          // ignore: prefer_const_constructors
                                          Color.fromARGB(255, 176, 215, 233))),
                              onPressed: () {},
                              child: const Text(
                                "Finalizar",
                                style: TextStyle(color: Colors.black),
                              ))),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
