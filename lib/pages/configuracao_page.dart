import 'package:app_srh/pages/pages_Home/main_page.dart';
import 'package:flutter/material.dart';

class ConfiguracaoPage extends StatefulWidget {
  const ConfiguracaoPage({super.key});

  @override
  State<ConfiguracaoPage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  String? nomeUsuario;
  String? altura;
  bool notification = false;
  bool temaEscuro = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
        ),
        body: ListView(
          children: [
            SwitchListTile(
                title: const Text("Notificaçês:"),
                value: notification,
                onChanged: (bool value) {
                  setState(() {
                    notification = value;
                  });
                }),
            SwitchListTile(
                title: const Text("Tema Escuro:"),
                value: temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                child: const Text("Voltar"))
          ],
        ),
      ),
    );
  }
}
