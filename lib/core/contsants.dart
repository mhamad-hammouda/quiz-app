import 'dart:ui';

import 'package:flutter/material.dart';

const KMainColor = Color(0xFF69A03A);
const colorpre = Color(0xFF673AB7);
const colorye = Colors.amber;

const decorationTextfield = InputDecoration(
  enabledBorder: OutlineInputBorder(),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  filled: true,
  contentPadding: EdgeInsets.all(20),
);

const Color correct = Colors.green ;
const Color incorrect = Colors.red ;
const Color neutral = Colors.white ;
const Color bl = Colors.black38;



const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 20.0;