// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Splash/presentation/SplashView.dart';
import 'package:quizapp/models/UserData.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserData(),
      child: MyApp(),
    ),
  );
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}

