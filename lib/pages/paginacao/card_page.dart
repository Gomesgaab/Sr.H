import 'package:app_srh/shared/componentes/text/textoCard_custon.dart';
import 'package:app_srh/shared/componentes/text/titlCard_custon.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Card(
            color: const Color.fromARGB(255, 251, 251, 241),
            elevation: 10,
            shadowColor: const Color.fromARGB(255, 0, 0, 0),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child:
                            const TitleCardCuston(title: "Dados Do paciente"),
                      )),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textedition(
                        texto: "Nome completo:",
                      ),
                      Textedition(texto: "Data de nascimento:"),
                      Textedition(texto: "Sexo:"),
                      Textedition(texto: "Endereço:"),
                      Textedition(texto: "telefone:"),
                      Textedition(texto: "E-mail:"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Card(
            color: const Color.fromARGB(255, 251, 251, 241),
            elevation: 10,
            shadowColor: const Color.fromARGB(255, 0, 0, 0),
            child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const TitleCardCuston(title: "Historico Medico"),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textedition(texto: "Alergias:"),
                        Textedition(texto: "Condições médicas:"),
                        Textedition(texto: "Cirurgias anteriores:"),
                        Textedition(texto: "lesões:"),
                        Textedition(texto: "Histórico Doenças Familiares:"),
                      ],
                    ),
                  ],
                )),
          ),
        )
      ],
    );
  }
}
