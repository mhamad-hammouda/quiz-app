// ignore_for_file: deprecated_member_use, prefer_final_fields, unnecessary_this, prefer_const_constructors, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/pages/Add_Question.dart';

import 'package:quizapp/pages/Score_Screen.dart';

class QuestionControler extends GetxController
    with SingleGetTickerProviderMixin {
      
  PageController? _pageController;

  PageController get pageController {
    _pageController = PageController();
    return _pageController!;
  }

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late BuildContext context;

  void setContext(BuildContext ctx) {
    this.context = ctx;
  }

  void restartQuiz(BuildContext context) {
    _questionNumber.value = 1;
    _numOfCorrectAns = 0;
    _isAnswered = false;
    _correctAns = -1; // Reset correct answer index
    _selectedAns = -1; // Reset selected answer index

    if (_pageController != null) {
      _pageController!.dispose(); // Dispose the existing controller
      _pageController = PageController(); // Create a new controller
    }

    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Add_Question()),
    );
  }

  late int _correctAns;
  int get correctAnwer => this._correctAns;

  late int _selectedAns;
  int get selectedAnswer => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    update();

    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController?.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ScoreScreen()),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    _pageController?.dispose();
    super.onClose();
  }

  void updateTheQnNum(int index) {
    _questionNumber.value += 1;
  }
}
