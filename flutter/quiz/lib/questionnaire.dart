import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Questionnaire extends StatelessWidget {
  final List<String> questions;
  final int questionIndex;
  final Function answerResponse;

  Questionnaire({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Having a compound widget improves performance and makes the code base lean in case of complex Widgets
        Question(questions[questionIndex]),
        // ... takes out the elements in a list and unwraps them
        ...['Yes', 'No'].map((answerText) {
          return Answer(answerResponse, answerText);
        })
      ],
    );
  }
}
