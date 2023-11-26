// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, camel_case_types, avoid_print

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
                    margin: EdgeInsets.fromLTRB(20, 100, 0, 150),
                    child: Text(
                      "Welcome...",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'myfont',
                      ),
                    )),
                TextFormField(
                  controller: UsernameController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: decorationTextfield.copyWith(
                    hintText: "Enter Your username : ",
                    suffixIcon: const Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 50),
                CustomGeneralButton(
                  text: 'Start',
                  onPressed: () {
                    addName(); // Call a function to handle the username
                  },
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addName() {
    final userData = Provider.of<UserData>(context, listen: false);
    String username = UsernameController.text.trim();

    if (username.isEmpty) {
      showSnackBar(context, 'Please enter your username');
    } else {
      userData.updateUser(Person(username: username,));
      print(username);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Add_Question()),
      );
    }
  }
}
