// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white30),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 60, vertical: 13)),
      ),
      child: Text(
      "$text",
        style: TextStyle(fontSize: 17, color: Colors.black , fontWeight: FontWeight.bold),
      ),
    );
  }
}
