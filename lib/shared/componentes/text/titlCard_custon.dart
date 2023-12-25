import 'package:flutter/material.dart';

final class TitleCardCuston extends StatelessWidget {
  final String title;
  const TitleCardCuston({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(70, 130, 169, 1),
      ),
    );
  }
}
