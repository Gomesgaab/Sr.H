import 'package:app_srh/model/cadastro_model.dart';
import 'package:app_srh/pages/Logn_Cadastro/login_page.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  //Shared

  var cadastro = const <CadastroSqliteModel>[];

  //crirando uma variavel de controle de nome
  var nomeControler = TextEditingController();
  //criando variavel de controle de endereco
  var enderecoControle = TextEditingController();
  //crirando uma variavel de controle de telefone
  var telefoneControler = TextEditingController();
  //crirando uma variavel de controle de email
  var emailControler = TextEditingController();
  //crirando uma variavel de controle de cpf
  var cpfControler = TextEditingController();

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
    obterDados();
  }

  obterDados() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 188, 218, 232),
        body: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/fundocadastro.png'),
                      fit: BoxFit.cover)),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              "asset/Logo.png",
                              height: 70,
                            ),
                          ),
                          const Text(
                            "Sr.H",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 60),
                      width: double.infinity,
                    ),
                    Container(
                      // dando margin na caixa de texto da senha
                      margin:
                          //symmtric usado para deixar uma simetria de acordo com o valor que você coloca
                          const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                      height: 50,
                      // dando o tamanho total da caixa que foi declarado
                      width: double.infinity,
                      //alinhamento
                      alignment: Alignment.center,
                      //caixa de entrada de texto
                      child: TextField(
                        controller: nomeControler,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 200, 228, 232))),
                          fillColor: Color.fromARGB(255, 200, 228, 232),
                          filled: true,
                          hintText: "Nome:",
                          icon: Icon(Icons.person_2),
                          contentPadding: EdgeInsets.only(top: 0, left: 10),
                        ),
                      ),
                    ),
                    Container(
                      // dando margin na caixa de texto da senha
                      margin:
                          //symmtric usado para deixar uma simetria de acordo com o valor que você coloca
                          const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                      height: 50,
                      // dando o tamanho total da caixa que foi declarado
                      width: double.infinity,
                      //alinhamento
                      alignment: Alignment.center,
                      //caixa de entrada de texto
                      child: TextField(
                        controller: enderecoControle,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 200, 228, 232))),
                          fillColor: Color.fromARGB(255, 200, 228, 232),
                          filled: true,
                          hintText: "Endereço:",
                          icon: Icon(Icons.location_city),
                          contentPadding: EdgeInsets.only(top: 0, left: 10),
                        ),
                      ),
                    ),
                    Container(
                      // dando margin na caixa de texto da senha
                      margin:
                          //symmtric usado para deixar uma simetria de acordo com o valor que você coloca
                          const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                      height: 50,
                      // dando o tamanho total da caixa que foi declarado
                      width: double.infinity,
                      //alinhamento
                      alignment: Alignment.center,
                      //caixa de entrada de texto
                      child: TextField(
                        controller: telefoneControler,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 200, 228, 232))),
                          fillColor: Color.fromARGB(255, 200, 228, 232),
                          filled: true,
                          hintText: "Telefone:",
                          icon: Icon(Icons.phone),
                          contentPadding: EdgeInsets.only(top: 0, left: 10),
                        ),
                      ),
                    ),
                    Container(
                      // dando margin na caixa de texto da senha
                      margin:
                          //symmtric usado para deixar uma simetria de acordo com o valor que você coloca
                          const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                      height: 50,
                      // dando o tamanho total da caixa que foi declarado
                      width: double.infinity,
                      //alinhamento
                      alignment: Alignment.center,
                      //caixa de entrada de texto
                      child: TextField(
                        controller: emailControler,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 200, 228, 232))),
                          fillColor: Color.fromARGB(255, 200, 228, 232),
                          filled: true,
                          hintText: "Email:",
                          icon: Icon(Icons.email),
                          contentPadding: EdgeInsets.only(top: 0, left: 10),
                        ),
                      ),
                    ),
                    Container(
                      // dando margin na caixa de texto da senha
                      margin:
                          //symmtric usado para deixar uma simetria de acordo com o valor que você coloca
                          const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                      height: 50,
                      // dando o tamanho total da caixa que foi declarado
                      width: double.infinity,
                      //alinhamento
                      alignment: Alignment.center,
                      //caixa de entrada de texto
                      child: TextField(
                          controller: cpfControler,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 200, 228, 232))),
                              fillColor: Color.fromARGB(255, 200, 228, 232),
                              filled: true,
                              hintText: "CPF:",
                              icon: Icon(Icons.document_scanner),
                              contentPadding:
                                  EdgeInsets.only(top: 0, left: 10))),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 17),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => const Color.fromARGB(
                                                  255, 176, 215, 233))),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()));
                                  },
                                  child: const Text(
                                    "Cancelar",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )),
                            //espaçamento entre os botões finalizar e cancelar
                            Expanded(child: Container()),
                            //salvar
                            Expanded(
                                flex: 1,
                                child: TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        backgroundColor: MaterialStateColor
                                            .resolveWith((states) =>
                                                // ignore: prefer_const_constructors
                                                Color.fromARGB(
                                                    255, 176, 215, 233))),
                                    //ação ao apertar button
                                    onPressed: () async {
                                      obterDados();
                                      setState(() {});
                                    },
                                    child: const Text(
                                      "Salvar",
                                      style: TextStyle(color: Colors.black),
                                    ))),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
