import 'package:flutter/material.dart';
import 'package:quizapp/models/Person.dart';

class UserData extends ChangeNotifier {
  Person _user = Person(
    username: 'Mhamad',
    score: [90, 85, 78],
    age: '18', // Adding a default age, you can change it as needed
  );

  Person get user => _user;

  void updateUser(Person newUser) {
    _user = newUser;
    notifyListeners();
  }
}
