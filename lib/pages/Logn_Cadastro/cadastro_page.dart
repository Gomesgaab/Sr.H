import 'package:app_srh/model/cadastroFuncionario_model.dart';
import 'package:app_srh/pages/pages_Home/main_pageAdmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  // iniciando intancia do fireBase
  final db = FirebaseFirestore.instance;

  //crirando uma variavel de controle de nome
  var nomeControler = TextEditingController();
  //crirando uma variavel de controle de telefone
  var telefoneControler = TextEditingController();
  //criando variavel de controle de endereco
  var enderecoControle = TextEditingController();
  //variavel de controle da data de nacimento
  var datacontole = TextEditingController(text: "");
  var dataNacimento = "";
  //variavel de controle cpf
  var cpfControle = TextEditingController();
  //variavel de controle genero
  var generoControle = TextEditingController();
  //variavel de controle do registro geral
  var rProficional = TextEditingController();
  //variavel de controle da espacialização
  var espacializacaoControler = TextEditingController();
  //crirando uma variavel de controle de email
  var emailControler = TextEditingController();
  //crirando uma variavel de controle de cpf
  var senhaControler = TextEditingController();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 188, 218, 232),
        body: ConstrainedBox(
          constraints: BoxConstraints(
            //MediaQuery e um metodo de pegar o tamanho do dispositivo
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: ListView(
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
                        margin: const EdgeInsets.symmetric(vertical: 5),
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
                        // dando margin
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
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 200, 228, 232))),
                            fillColor: Color.fromARGB(255, 200, 228, 232),
                            filled: true,
                            icon: Icon(Icons.date_range),
                            contentPadding: EdgeInsets.only(top: 0, left: 10),
                            hintText: "Data Nacimento",
                          ),
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
                      ), //fim data de nacimento
                      Container(
                        // dando margin
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
                            controller: cpfControle,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 200, 228, 232))),
                                fillColor: Color.fromARGB(255, 200, 228, 232),
                                filled: true,
                                hintText: "CPF:",
                                icon: Icon(Icons.document_scanner),
                                contentPadding:
                                    EdgeInsets.only(top: 0, left: 10))),
                      ), // fim cpf
                      Container(
                        //inicio genero
                        // dando margin
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
                          controller: generoControle,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 200, 228, 232))),
                            fillColor: Color.fromARGB(255, 200, 228, 232),
                            filled: true,
                            hintText: "Gênero:",
                            icon: Icon(Icons.man_3_sharp),
                            contentPadding: EdgeInsets.only(top: 0, left: 10),
                          ),
                        ),
                      ), //fim genero
                      Container(
                        // dando margin
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
                      // container senha
                      Container(
                        // dando margin
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
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          controller: senhaControler,
                          obscureText: isObscureText,
                          onChanged: (value) {
                            debugPrint(value);
                          },
                          // decorando caixa de entrada de texto
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  borderSide: BorderSide(
                                      color:
                                          // cor da borda do imput
                                          Color.fromARGB(255, 200, 228, 232))),
                              fillColor:
                                  //cor de fundo
                                  const Color.fromARGB(255, 200, 228, 232),
                              //permitindo cor de fundo
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.only(top: 0, left: 10),
                              //cor icon
                              iconColor: const Color.fromARGB(255, 0, 0, 0),
                              icon: const Icon(Icons.lock),
                              //estamos detectando ações para executar algo
                              suffixIcon: GestureDetector(
                                //um clique
                                onTap: () {
                                  setState(() {
                                    //escondendo texto (!isObscureText negação oposto do que ele vale)
                                    isObscureText = !isObscureText;
                                  });
                                },
                                // utilizando ternário para execução de ação
                                child: Icon(isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              hintText: "Senha"),
                        ),
                      ), //fim container senha
                      //container botão cancelar
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
                                                (states) =>
                                                    const Color.fromARGB(
                                                        255, 176, 215, 233))),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainPageAdmin()));
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
                                                      BorderRadius.circular(
                                                          20))),
                                          backgroundColor: MaterialStateColor
                                              .resolveWith((states) =>
                                                  // ignore: prefer_const_constructors
                                                  Color.fromARGB(
                                                      255, 176, 215, 233))),
                                      //ação ao apertar button
                                      onPressed: () async {
                                        //fechando teclado ao clicar no botão para evitar erros
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        var cadastroFuncionario =
                                            CadastroFuncionarioModel(
                                          nome: nomeControler.text,
                                          telefone: telefoneControler.text,
                                          endereco: enderecoControle.text,
                                          dtNacimento:
                                              DateTime.parse(datacontole.text),
                                          cPF: int.tryParse(cpfControle.text),
                                          genero: generoControle.text,
                                          especializacao: "",
                                          email: emailControler.text,
                                          senha: senhaControler.text,
                                        );

                                        setState(() {});
                                        await db
                                            .collection("Funcionario")
                                            .add(cadastroFuncionario.toJson());
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
      ),
    );
  }
}
