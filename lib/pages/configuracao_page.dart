import 'package:app_srh/pages/pages_Home/main_page.dart';
import 'package:app_srh/pages/service/storage_app.dart';
import 'package:flutter/material.dart';

class ConfiguracaoPage extends StatefulWidget {
  const ConfiguracaoPage({super.key});

  @override
  State<ConfiguracaoPage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  //shared
  AppStorage storage = AppStorage();

  @override
  void initState() {
    // TODO: implement initS tate
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    notification = await storage.getDadosConfiguracaoNotificacao();
    digital = await storage.getDadosConfiguracaoDigital();
    setState(() {});
  }

  bool notification = false;
  bool digital = false;

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
                title: const Text("Usar Digital:"),
                value: digital,
                onChanged: (bool value) {
                  setState(() {
                    digital = value;
                  });
                }),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                child: const Text("Voltar")),
            TextButton(
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const MainPage()));
                  await storage.setDadosConfiguracaoNotificacao(notification);
                  await storage.setDadosConfiguracaoDigital(digital);
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
