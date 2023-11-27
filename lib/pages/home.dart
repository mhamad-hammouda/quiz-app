// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/models/widgets/QuestionCard.dart';
import 'package:quizapp/models/widgets/Question_Controler.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionControler _questionController = Get.put(QuestionControler());

    _questionController.setContext(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 80),
              child: Text(
                'PY',
                style: TextStyle(
                  fontFamily: 'myfont',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Text(
              'Quiz',
              style: TextStyle(
                fontFamily: 'myfont',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _questionController.nextQuestion();
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'myfont',
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              // ProgressBar(),
              SizedBox(height: 20),
              Obx(
                () => Text.rich(
                  TextSpan(
                    text: 'Question ${_questionController.questionNumber.value}',
                    style: Theme.of(context).textTheme.headline4,
                    children: [
                      TextSpan(
                        text: '/${_questionController.questions.length}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.6, // Adjust the height as needed
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.questions[index],
                  ),
                ),
              ),
              SizedBox(height: 20), // Add spacing after the PageView
            ],
          ),
        ),
      ),
    );
  }
}
