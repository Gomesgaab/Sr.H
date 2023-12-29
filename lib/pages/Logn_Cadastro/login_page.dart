import 'package:app_srh/pages/Logn_Cadastro/cadastro_page.dart';
import 'package:app_srh/pages/pages_Home/main_page.dart';
import 'package:app_srh/pages/service/storage_app.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  var emailControler = TextEditingController();
  var senhaControler = TextEditingController();
  bool isObscureText = true;

  AppStorage storage = AppStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    senhaControler.text = await storage.getDadoSenha();
    emailControler.text = await storage.getDadosLoginEmail();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // alterando cor de fundo da tela inteira
        backgroundColor: const Color.fromARGB(255, 188, 218, 232),
        // responsividade
        body: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/loginimage.png'),
                      fit: BoxFit.cover)),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  //MediaQuery e um metodo de pegar o tamanho do dispositivo
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //alinhamento
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
                      height: 100,
                      width: double.infinity,
                    ),
                    // conteiner do email
                    Expanded(
                      flex: 0,
                      child: Container(
                        //definindo margin da caixa de texto email
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        height: 50,
                        // dando o tamanho total da caixa que foi declarado
                        width: double.infinity,
                        // textFild caixa de entrada de texto/ input
                        child: TextField(
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          controller: emailControler,
                          onChanged: (value) {
                            debugPrint(value);
                          },
                          //decoration teg para decoração do text fild
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 200, 228, 232))),
                            fillColor: Color.fromARGB(255, 200, 228, 232),
                            filled: true,
                            //Arrumando borda e deixando so linha inferior
                            hintText: "Email",

                            iconColor: Colors.white,
                            icon: Icon(
                              Icons.email,
                            ),
                            contentPadding: EdgeInsets.only(top: 0, left: 10),
                            //hintText parecida com a label, testo de informação da caixa
                          ),
                        ),
                      ),
                    ),

                    // container senha
                    Expanded(
                      flex: 0,
                      child: Container(
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
                              iconColor: Colors.white,
                              icon: const Icon(Icons.lock),
                              //estamos detectando ações para executar algo
                              suffixIcon: GestureDetector(
                                //um clique
                                onTap: () {
                                  setState(() {
                                    //escondendo texto
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
                      ),
                    ),
                    // espaçamento
                    const SizedBox(
                      height: 30,
                    ),

                    //conteiner do botão entrar
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 200,
                          child: TextButton(
                              // printando ingormações preencihas quando clicar no botão
                              onPressed: () async {
                                //fechando teclado ao clicar no botão para evitar erros
                                FocusManager.instance.primaryFocus?.unfocus();

                                if (emailControler.text.trim() ==
                                        "gabrielgabiga870@gmail.com" &&
                                    senhaControler.text.trim() == "senha") {
                                  //mostrando mensagem a usuário se o logim foi efetuado com sucesso
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     const SnackBar(
                                  //         content: Text(
                                  //             "Login efetuado com sucesso")));
                                  //Navegação entre as pages
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainPage()));
                                } else {
                                  //mostrando mensagem a usuário se o logim foi efetuado
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          title: const Text("Erro"),
                                          content: const Text(
                                              " email ou senha incorreto"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Fechar"))
                                          ],
                                        );
                                      });
                                }
                                //assim que e apertado o botão entrar e guardado em cache os dados
                                //chamando a chave para armazenamento dos dados em cache
                                await storage
                                    .setDadosLoginEmail(emailControler.text);
                                await storage
                                    .setDadosLoginSenha(senhaControler.text);
                              },
                              style: ButtonStyle(
                                  //border radios do botão
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(
                                          255, 222, 222, 223))),
                              child: const Text(
                                "Entrar",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )),
                        )),
                    // espacamento
                    SizedBox(height: 20, child: Container()),
                    // fim botão entrar

                    TextButton(
                      onPressed: () {
                        //Navegação entre as página cadastro
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TelaCadastro()));
                      },
                      child: const Text(
                        "Não possui conta? Criar Conta",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
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
