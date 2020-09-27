import 'package:flutter/material.dart';

import './questionnaire.dart';
import './result.dart';

// We can declare the constructors in any of the below ways

// class Test {
//   String name;
//   int age;

//   {} make the parameters named optional arguments

//   Test({this.name, this.age=23});

//   Test({String name, int age=23}){
//     this.name = name;
//     this.age = age;
//   }

//   This another constructor for class Test, which sets the age = 20 by default
//   Test.aDifferentConstructor(this.name){
//      this.age = 20
//   }
// }

void main() {
  runApp(Quiz());
}

// If the function body can fit in a line we can use the alternative syntax
// void main() => runApp(Quiz());

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

// _ before any name makes it private property and can be accessed from the same file
class _QuizState extends State<Quiz> {
  // var infers the type from the value assigned, here it is int now we cannot assign any type other than int to _questionIndex
  var _questionIndex = 0;
  double _totalScore = 0;
  // final is runtime constant whereas const is compile time constant
  // dart stores the references to the value objects instead of values, so if we want to make sure that the value doesnt change we can make the value constant
  static const _questions = const [
    '''Have you traveled to an area of high-risk for COVID-19?''',
    '''Have you been around someone who recently traveled to an area of high-risk and is also sick?''',
    '''Have you been around someone who is known to have COVID-19?''',
    '''Have you been told by a health official that you may have been exposed to the virus''',
    '''Have you had a fever recently? Or do you think you have a fever?''',
    '''Do you have a cough?''',
    '''Do you feel tired for no reason?''',
    '''Do you have body aches?''',
    '''Do you have a sore throat?''',
    '''Do you have a reduced sense of smell or taste?''',
    '''Are you experiencing diarrhea?''',
    '''Are you feeling mild to moderate shortness of breath or mild to moderate difficulty breathing?''',
    '''Do you have chest pain?''',
    '''COVID-19 can affect people who have weaker immune systems from things like chemotherapy, HIV/AIDS, organ transplant, being pregnant, or prolonged steroid use. Do you fall under this category?'''
  ];

  static const _answerScores = const [
    6.0,
    4.0,
    10.0,
    8.0,
    8.0,
    8.0,
    6.0,
    8.0,
    8.0,
    10.0,
    8.0,
    12.0,
    10.0,
    6.0
  ];

  void _answerQuestion(score) {
    _totalScore += score;
    // Flutter re-renders (rebuilds) the specific UI elements that are linked to the questionIndex property
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override // Good practice to add this to functions we are overriding
  Widget build(BuildContext context) {
    // Scaffold offers some API's which implements material design visual layout structure.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Column(
          children: [
            Text('COVID-19'),
            Text(
              'Self Assessment',
              style: TextStyle(fontSize: 12),
            )
          ],
        )),
        body: _questionIndex < _questions.length
            // To make the code clean we can convert any widget tree into a widget
            // Ternary operator to show the result at the end of Questionnaire
            ? Questionnaire(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
                answerScores: _answerScores,
              )
            : Result(_totalScore),
      ),
    );
  }
}
