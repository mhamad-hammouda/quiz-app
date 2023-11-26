// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class question_widget extends StatelessWidget {
  final String Question;
  final int index;
  final totalQuestions;

  question_widget(
      {required this.Question,
      required this.index,
      required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Question ${index + 1}/ $totalQuestions:',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 30,),
          Text(
            'h',
            style: TextStyle(fontSize: 40),
          ),
          
        ],
      ),
    );
  }
}
