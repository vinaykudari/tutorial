import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // Since we are not assigning any value to variable its a good practice to tell the type instead of var
  // As it is a stateless widget we use final before declaring the variable to enforce no-change rule on the var
  final String questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}
