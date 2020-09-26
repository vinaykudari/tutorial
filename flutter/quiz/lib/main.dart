import 'package:flutter/material.dart';

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
// }

void main() {
  runApp(Quiz());
}

// If the function body can fit in a line we can use the alternative syntax
// void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  void answerResponse() {
    print('hello');
  }

  // Flutter calls build everytime when there's update on the screen
  @override // Good practice to add this to functions we are overriding
  Widget build(BuildContext context) {
    // Scaffold offers some API's which implements material design visual layout structure.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Column(
          children: <Widget>[
            Text('Question'),
            RaisedButton(
              child: Text('Answer 1'),
              // Passing function pointer to onPressed
              onPressed: answerResponse,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              // Anonymous function: Single line
              onPressed: () => print('Yo'),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              // Anonymous function: Block
              onPressed: () {
                print('heyya');
              },
            ),
            RaisedButton(
              child: Text('Answer 4'),
              onPressed: answerResponse,
            ),
          ],
        ),
      ),
    );
  }
}
