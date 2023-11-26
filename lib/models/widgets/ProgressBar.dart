// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quizapp/models/widgets/Question_Controler.dart';

// class ProgressBar extends StatelessWidget {
//   const ProgressBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 20),
//       width: double.infinity,
//       height: 25,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.black),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: GetBuilder<QuestionControler>(
//         init: QuestionControler(),
//         builder: (QuestionControler controller) {
//           return Stack(
//             children: [
//               LayoutBuilder(
//                 builder: (context, constraints) => Container(
//                   width: constraints.maxWidth * controller.animation.value,
//                   decoration: BoxDecoration(
//                     color: Colors.cyanAccent,
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('${(controller.animation.value *60).round()} sec'),
//                       Icon(
//                         Icons.timelapse,
//                         size: 20,
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
