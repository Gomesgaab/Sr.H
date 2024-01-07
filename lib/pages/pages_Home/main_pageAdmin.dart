import 'package:app_srh/pages/paginacao/cadastrar.dart';
import 'package:app_srh/pages/paginacao/dados_page.dart';
import 'package:app_srh/pages/paginacao/funcionariosPage.dart';
import 'package:app_srh/shared/componentes/menu_custon.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainPageAdmin extends StatefulWidget {
  const MainPageAdmin({super.key});

  @override
  State<MainPageAdmin> createState() => _MainPageAdminState();
}

class _MainPageAdminState extends State<MainPageAdmin> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;
  @override
  Widget build(BuildContext context) {
    //area  separada
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: const Color.fromARGB(26, 155, 194, 232),
          actions: [
            //titulo
            const Text(
              "Administrador",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            // logo
            Image.asset(
              'asset/Logo.png',
              height: 67.6,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Sr .H",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
        drawer: const CustonMenu(),
        //menu lateral
        //construindo body/corpo
        body: Expanded(
          child: PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                page = value;
              });
            },
            children: const [
              FuncionarioPage(),
              DadosPage(),
              CadastroPage(),
            ],
          ),
        ),

        //iniciando Navif=gation bar
        bottomNavigationBar: CurvedNavigationBar(
          items: const <Widget>[
            Icon(Icons.dock, size: 30),
            Icon(Icons.home_filled, size: 30),
            Icon(Icons.list, size: 30)
          ],
          backgroundColor: const Color.fromARGB(122, 149, 175, 201),
          height: 70,
          onTap: (page) => setState(() {
            controller.animateToPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
                page);
          }),
        ),
      ),
    );
  }
}
