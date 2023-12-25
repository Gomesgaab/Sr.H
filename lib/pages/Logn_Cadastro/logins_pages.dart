import 'package:flutter/material.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2();
}

class _LoginPage2 extends State<LoginPage2> {
  var emailControler =
      TextEditingController(text: "gabrielgabiga870@gmail.com");
  var senhaControler = TextEditingController(text: "senha");
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        alignment: Alignment.center,
        /* padding: const EdgeInsets.all(0), */
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/fundoLogin.webp'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
