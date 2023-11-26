// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizapp/core/contsants.dart';
import 'package:quizapp/core/widgets/Snackbar.dart';
import 'package:quizapp/core/widgets/custombuttons.dart';
import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/models/widgets/Question_Controler.dart';
import 'package:quizapp/pages/home.dart';

class Add_Question extends StatefulWidget {
  const Add_Question({Key? key}) : super(key: key);

  @override
  State<Add_Question> createState() => _Add_QuestionState();
}

QuestionControler _questionController = Get.put(QuestionControler());

class _Add_QuestionState extends State<Add_Question> {
  final IDcontroller = TextEditingController();
  final QuestionController = TextEditingController();
  final OptionsController = TextEditingController();
  final CorrectAnswerController = TextEditingController();

  void addQuestion() {
    if (IDcontroller.text.isEmpty ||
        QuestionController.text.isEmpty ||
        OptionsController.text.isEmpty ||
        CorrectAnswerController.text.isEmpty) {
      showSnackBar(context, 'Please enter all the data');
      return;
    }

    // Here you should add 'newQuestion' to your data structure or perform required operations
    // For example, if you have a global list named 'questionsList'
    Question newQuestion = Question(
      id: int.parse(IDcontroller.text),
      question: QuestionController.text,
      options: OptionsController.text.split(','),
      answer: int.parse(CorrectAnswerController.text),
    );

    _questionController.questions.add(newQuestion);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(20, 100, 0, 50),
                  child: Text(
                    "Add Question...",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'myfont',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: IDcontroller,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    decoration: decorationTextfield.copyWith(
                      hintText: "Enter question ID : ",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: QuestionController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationTextfield.copyWith(
                      hintText: "Enter the question : ",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: OptionsController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: decorationTextfield.copyWith(
                      hintText: "Enter question options : ",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: CorrectAnswerController,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    decoration: decorationTextfield.copyWith(
                      hintText: "Enter index of correct answer : ",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                CustomGeneralButton(
                  text: 'Add',
                  onPressed: addQuestion,
                ),
                SizedBox(height: 40),
                CustomGeneralButton(
                  text: 'skip',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
