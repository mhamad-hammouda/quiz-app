// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:quizapp/core/sizeconfig.dart';

class Horizental extends StatelessWidget {
  const Horizental(this.value);

  final double value ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize! * value,
    );
  }
}

class vertical extends StatelessWidget {
  const vertical(this.value);

  final double value ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * value,
    );
  }
}