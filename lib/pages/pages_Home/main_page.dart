import 'package:app_srh/pages/paginacao/prontuario_page.dart';
import 'package:app_srh/shared/componentes/menu_custon.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    //area  separada
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: const Color.fromARGB(26, 155, 194, 232),
          actions: [
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
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/fundo_home.png'),
                        fit: BoxFit.cover)),
              ),
              const PageProntuario(),
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
          onTap: (value) => setState(() {
            controller.jumpToPage(value);
          }),
        ),
      ),
    );
  }
}
