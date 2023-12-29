import 'package:flutter/material.dart';

class CustonImput extends StatelessWidget {
  const CustonImput({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Color.fromARGB(255, 200, 228, 232))),
        fillColor: Color.fromARGB(255, 200, 228, 232),
        filled: true,
        contentPadding: EdgeInsets.only(top: 0, left: 10),
      ),
    );
  }
}
