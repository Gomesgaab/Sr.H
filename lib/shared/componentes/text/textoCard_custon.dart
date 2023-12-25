import 'package:flutter/material.dart';

final class Textedition extends StatelessWidget {
  final String texto;
  const Textedition({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(70, 130, 169, 1),
        ),
      ),
    );
  }
}
