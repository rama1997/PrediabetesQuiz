import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  final Function selectHandler;
  final String answerText;
  final String answerType;
  final List<String> dropDownAnswers;
  final bool lastDrop;

  Answer(this.selectHandler, this.answerText, this.answerType,
      this.dropDownAnswers, this.lastDrop);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool choicePicked = false;
  String dropDownValue;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.answerType == 'onPress') //if onpress type questions, use raised button
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(widget.answerText),
                onPressed: widget.selectHandler,
              )
            else  // else use dropdownbutton for dropdownmenu type questions
              DropdownButton<String>(
                value: dropDownValue != null
                    ? dropDownValue
                    : widget.dropDownAnswers[0],
                onChanged: (String newValue) {
                  setState(() {
                    dropDownValue = newValue;
                    choicePicked = true;
                  });
                },
                items: widget.dropDownAnswers.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            if (widget.answerType == 'dropDown' && widget.lastDrop == true) //raised button for dropdownmenu, only does it for last menu
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Next"),
                onPressed: widget.selectHandler,
              ),
          ],
        ),
      ),
    );
  }
}

