import 'package:app_srh/shared/componentes/menu_custon.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    //area  separada
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: const Color.fromARGB(116, 155, 194, 1000),
          actions: [
            // logo
            Image.asset(
              'asset/Logo.png',
              height: 67.6,
            ),
            const SizedBox(
              width: 50,
            ),
          ],
        ),

        //menu lateral
        drawer: const CustonMenu(),
        //construindo body/corpo
        body: Expanded(
          child: Container(
            color: const Color.fromARGB(116, 155, 194, 1000),
          ),
        ),

        //iniciando Navif=gation bar
        bottomNavigationBar: CurvedNavigationBar(
          items: const <Widget>[
            Icon(Icons.dock, size: 30),
            Icon(Icons.home_filled, size: 30),
            Icon(Icons.list, size: 30)
          ],
          backgroundColor: const Color.fromARGB(116, 155, 194, 1000),
          index: index,
          height: 70,
          onTap: (index) => setState(() {
            this.index = index;
          }),
        ),
      ),
    );
  }
}
