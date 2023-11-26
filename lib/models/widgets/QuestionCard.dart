// ignore_for_file: prefer_const_constructors, deprecated_member_use, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/models/widgets/Option.dart';
import 'package:quizapp/models/widgets/Question_Controler.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionControler _questionController = Get.put(QuestionControler());

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(25)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context).textTheme.headline6,
            ),
            ...List.generate(
                question.options.length,
                (index) => Option(
                      text: question.options[index],
                      index: index,
                      press: () {
                        _questionController.checkAns(question, index);
                      },
                    ))
          ],
        ),
      ),
    );
  }
}
