// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'Widgets/SplashView_Body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white  ,
      body: SplashView_body(),
    );
  }
}