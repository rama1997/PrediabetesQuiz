import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String resultPhrase() {
    String resultText;
    if (resultScore >= 5) {
      resultText = 'HIGH RISK AND ARE LIKELY TO HAVE PREDIABETES';
    } else {
      resultText = 'LOW RISK FOR PREDIABETES';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase(),
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text(
            'Retake Test!',
            style: TextStyle(fontSize:24),
          ),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: resetHandler,
        ),
      ],
    ));
  }
}
