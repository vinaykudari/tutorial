import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Questionnaire extends StatelessWidget {
  final List<String> questions;
  final List<double> answerScores;
  final int questionIndex;
  final Function answerQuestion;

  Questionnaire({
    @required this.questions,
    @required this.answerScores,
    @required this.questionIndex,
    @required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Having a compound widget improves performance and makes the code base lean in case of complex Widgets
        Question(questions[questionIndex]),
        // ... takes out the elements in a list and unwraps them
        ...['Yes', 'No'].map((answerText) {
          double score = -0.25;
          if (answerText == 'Yes') {
            score = answerScores[questionIndex];
          }
          // Passing an anonymous function as we need to pass score to answerQuestion
          return Answer(() => answerQuestion(score), answerText);
        })
      ],
    );
  }
}
