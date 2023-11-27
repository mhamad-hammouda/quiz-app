// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/core/contsants.dart';
import 'package:quizapp/core/widgets/Snackbar.dart';
import 'package:quizapp/core/widgets/custombuttons.dart';
import 'package:quizapp/models/Person.dart';
import 'package:quizapp/models/UserData.dart';
import 'package:quizapp/pages/Add_Question.dart';

class Add_name extends StatefulWidget {
  const Add_name({Key? key}) : super(key: key);

  @override
  State<Add_name> createState() => _Add_nameState();
}

class _Add_nameState extends State<Add_name> {
  final UsernameController = TextEditingController();

  bool _isYellowBackground = false;
  int _selectedAge = 18;
  String? _selectedTitle; // New variable to store selected title

  List<int> ageOptions = [
    18,
    25,
    35,
    45,
    60,
  ]; // List of age options as integers

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
                  margin: EdgeInsets.fromLTRB(20, 50, 0, 90),
                  child: Text(
                    "Welcome...",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'myfont',
                    ),
                  ),
                ),
                TextFormField(
                  controller: UsernameController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: decorationTextfield.copyWith(
                    hintText: "Enter Your username : ",
                    suffixIcon: const Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Change Background',
                      style: TextStyle(
                        fontFamily: 'myfont',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Checkbox(
                      value: _isYellowBackground,
                      onChanged: (value) {
                        setState(() {
                          _isYellowBackground = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 130,
                  child: DropdownButtonFormField<int>(
                    value: _selectedAge,
                    items: ageOptions.map((int age) {
                      return DropdownMenuItem<int>(
                        value: age,
                        child: Text(age.toString()),
                      );
                    }).toList(),
                    onChanged: (int? value) {
                      setState(() {
                        _selectedAge = value ?? 18;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Your Age',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      value: 'Ms',
                      groupValue: _selectedTitle,
                      onChanged: (value) {
                        setState(() {
                          _selectedTitle = value;
                        });
                      },
                    ),
                    Text('Ms'),
                    Radio<String>(
                      value: 'Mrs',
                      groupValue: _selectedTitle,
                      onChanged: (value) {
                        setState(() {
                          _selectedTitle = value;
                        });
                      },
                    ),
                    Text('Mrs'),
                  ],
                ),
                SizedBox(height: 20),
                CustomGeneralButton(
                  text: 'Start',
                  onPressed: () {
                    addName();
                  },
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: _isYellowBackground ? Colors.yellow : Colors.white,
    );
  }

  void addName() {
    final userData = Provider.of<UserData>(context, listen: false);
    String username = UsernameController.text.trim();

    if (username.isEmpty) {
      showSnackBar(context, 'Please enter your username');
    } else if (_selectedTitle == null) {
      showSnackBar(context, 'Please select title (Ms or Mrs)');
    } else {
      String fullName = '$_selectedTitle. $username';
      userData.updateUser(Person(
        username: fullName,
        age: _selectedAge.toString(),
      ));
      print(fullName);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Add_Question()),
      );
    }
  }
}
