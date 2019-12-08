import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String resultPhrase() {
    String resultText;
    if (resultScore >= 5) {
      resultText =
          'HIGH RISK AND ARE LIKELY TO HAVE PREDIABETES. \n\n Based on your results, you’re likely to have prediabetes, but only your doctor can diagnose it for sure. \n';
    } else {
      resultText =
          'LOW RISK FOR PREDIABETES. \n\n Based on your results, you’re at low risk for prediabetes. Keep up the good work!\n';
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
          style: TextStyle(fontSize: 36),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text(
            'Retake Test!',
            style: TextStyle(fontSize: 24),
          ),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: resetHandler,
        ),
      ],
    ));
  }
}
