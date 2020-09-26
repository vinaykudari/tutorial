import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // answerHandler is a function hence we use Function as it's type
  final Function answerHandler;
  final String answerText;

  Answer(this.answerHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue[100],
        textColor: Colors.black,
        child: Text(answerText),
        onPressed: answerHandler,
      ),
    );
  }
}
