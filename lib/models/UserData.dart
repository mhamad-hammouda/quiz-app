import 'package:flutter/material.dart';
import 'package:quizapp/models/Person.dart';

class UserData extends ChangeNotifier {
  Person _user = Person(username: 'Mhamad', score: [90, 85, 78] );

  Person get user => _user;

  void updateUser(Person newUser) {
    _user = newUser;
    notifyListeners(); 
  }
  
}
