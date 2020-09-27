import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double finalScore;

  Result(this.finalScore);

  String get riskText {
    String risk;
    if (finalScore < 3) {
      risk = 'low';
    } else if (finalScore <= 7) {
      risk = 'medium';
    } else {
      risk = 'high';
    }
    return risk;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'You are at $riskText risk of contacting COVID',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
