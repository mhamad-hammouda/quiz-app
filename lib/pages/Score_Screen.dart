// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_final_fields, non_constant_identifier_names, unused_local_variable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/core/widgets/custombuttons.dart';
import 'package:quizapp/models/Person.dart';
import 'package:quizapp/models/UserData.dart';
import 'package:quizapp/models/widgets/Question_Controler.dart';
import 'package:quizapp/pages/view_scores.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  QuestionControler _questionControler = Get.put(QuestionControler());

  bool scoreUpdated = false;

  double getProgressPercent() {
    // Calculate progress percentage based on the number of correct answers
    double percentage = _questionControler.numOfCorrectAns /
        _questionControler.questions.length;
    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);

    int totalQuestions = _questionControler.questions.length;
    int correctAnswers = _questionControler.numOfCorrectAns;

    void Score() {
      if (!scoreUpdated) {
        UserData userData = Provider.of<UserData>(context, listen: false);

        Person currentUser = userData.user;

        List<int> updatedScoreList = List.from(currentUser.score);
        updatedScoreList.add(correctAnswers * 10);

        Person updatedUser = Person(
          username: currentUser.username,
          score: updatedScoreList,
          age: '${currentUser.age}',
        );

        userData.updateUser(updatedUser);

        scoreUpdated = true;
      }
    }

    bool passedHalf = correctAnswers >= totalQuestions / 2;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Consumer<UserData>(
                  builder: (context, userData, child) {
                    Person user = userData.user;
                    return Text(
                      passedHalf
                          ? 'Congratulations, ${user.getUsername}!!'
                          : 'Oops!',
                      style: TextStyle(fontSize: 30),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              passedHalf
                  ? Image.asset(
                      'assets/images/passed.jpg',
                      width: 100,
                    ) // Display this image if score is over half
                  : Image.asset(
                      'assets/images/failed.webp',
                      width: 100,
                    ), // Display
              SizedBox(
                height: 10,
              ),
              Text(
                'Your Score: ',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 60,
              ),
              CircularPercentIndicator(
                radius: 250.0,
                lineWidth: 8.0,
                animation: true,
                animateFromLastPercent: true,
                animationDuration: 250,
                percent: getProgressPercent(),
                center: Text(
                  '${correctAnswers * 10}/${totalQuestions * 10}',
                  style: TextStyle(fontSize: 35, color: Colors.black54),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Color.fromARGB(255, 255, 85, 113),
                backgroundColor: Colors.grey,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomGeneralButton(
                    text: 'Retry',
                    onPressed: () {
                      _questionControler.restartQuiz(context);
                      Score();
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CustomGeneralButton(
                    text: 'view',
                    onPressed: () async {
                      if (!scoreUpdated) {
                        Score(); // Update the score if it hasn't been updated before
                      }
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScoreTableScreen()),
                      );
                      if (result == null || result == false) {
                        scoreUpdated = true;
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
