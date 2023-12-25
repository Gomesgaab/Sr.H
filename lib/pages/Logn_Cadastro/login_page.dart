import 'package:app_srh/pages/Logn_Cadastro/cadastro_page.dart';
import 'package:app_srh/pages/pages_Home/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  var emailControler =
      TextEditingController(text: "gabrielgabiga870@gmail.com");
  var senhaControler = TextEditingController(text: "senha");
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // alterando cor de fundo do corpo
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
                        )),
                  )
                ])),
        // responsividade
        body: ConstrainedBox(
          constraints: BoxConstraints(
            //MediaQuery e um metodo de pegar o tamanho do dispositivo
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //alinhamento
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 80),
                child: const Text(
                  "Bem Vindo",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              // conteiner do email
              Container(
                //definindo margin da caixa de texto email
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 30,
                // dando o tamanho total da caixa que foi declarado
                width: double.infinity,
                // textFild caixa de entrada de texto/ input
                child: TextField(
                  controller: emailControler,
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  //decoration teg para decoração do text fild
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 70),
                    //Arrumando borda e deixando so linha inferior
                    hintText: "Email", icon: Icon(Icons.email),
                    //hintText parecida com a label, testo de informação da caixa
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
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  height: 30,
                  // dando o tamanho total da caixa que foi declarado
                  width: double.infinity,
                  //alinhamento
                  alignment: Alignment.center,
                  //caixa de entrada de texto
                  child: TextField(
                    controller: senhaControler,
                    obscureText: isObscureText,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    // decorando caixa de entrada de texto
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 25),
                        //Arrumando borda
                        icon: const Icon(Icons.lock),
                        //estamos detectando ações para executar algo
                        suffixIcon: GestureDetector(
                          //um clique
                          onTap: () {
                            setState(() {
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
                        onPressed: () {
                          if (emailControler.text.trim() ==
                                  "gabrielgabiga870@gmail.com" &&
                              senhaControler.text.trim() == "senha") {
                            //mostrando mensagem a usuário se o logim foi efetuado com sucesso
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //         content:
                            //             Text("Login efetuado com sucesso")));
                            //Navegação entre as pages
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                          } else {
                            //mostrando mensagem a usuário se o logim foi efetuado
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Erro ao efetuar login, email ou senha incorretos")));
                          }
                        },
                        style: ButtonStyle(
                            //border radios do botão
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(78, 222, 222, 223))),
                        child: const Text(
                          "Entrar",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )),
                  )),
              // espacamento
              SizedBox(height: 30, child: Container()),
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
                    color: Color.fromARGB(255, 123, 117, 119),
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
