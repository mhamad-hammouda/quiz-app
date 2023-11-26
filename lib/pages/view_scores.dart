// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/models/Person.dart';
import 'package:quizapp/models/UserData.dart';

class ScoreTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access UserData from Provider
    UserData userData = Provider.of<UserData>(context, listen: false);

    // Access single user's data from UserData
    Person user = userData.user;

    return WillPopScope(
      onWillPop: () async {
          Navigator.pop(context, true); // Pass true if score was updated, false otherwise
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scores Table'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'User Name: ${user.username}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(
                          label: Text('Scores')), // Label for the first column
                      DataColumn(
                          label: Text('Value')), // Label for the second column
                    ],
                    rows: user.score.asMap().entries.map((entry) {
                      return DataRow(cells: [
                        DataCell(Text(
                            'Score ${entry.key + 1}')), // Dynamically generate 'Score 1', 'Score 2', etc.
                        DataCell(Text(entry.value
                            .toString())), // Display score value in the second column
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
