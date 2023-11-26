// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quizapp/core/sizeconfig.dart';
import 'package:quizapp/pages/Add_name.dart';


class SplashView_body extends StatefulWidget {
  const SplashView_body({Key? key}) : super(key: key);

  @override
  State<SplashView_body> createState() => _SplashView_bodyState();
}

class _SplashView_bodyState extends State<SplashView_body>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    GotoNextView();
  }

  void GotoNextView() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Add_name()),
      );
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/pyth.png',
            width: 200,
          ),
          Center(
            child: FadeTransition(
              opacity: fadingAnimation!,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PY',
                        style: TextStyle(
                            fontFamily: 'myfont',
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Text(
                        'Quiz',
                        style: TextStyle(
                            fontFamily: 'myfont',
                            fontSize: 51,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
