import 'package:app_srh/pages/Logn_Cadastro/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            //PrimaryColor (cor principal da aplicação)
            primaryColor: const Color.fromARGB(70, 130, 169, 1000),
            //Fonte/estilo de texto principal
            textTheme: GoogleFonts.abhayaLibreTextTheme()),
        home: const LoginPage());
  }
}