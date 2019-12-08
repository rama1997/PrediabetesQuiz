import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex,});

  @override
  Widget build(BuildContext context) {
    int dropCount = -1; //counter for dropDownMenu
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          dropCount++;
          List<List<String>> dropdownAnswers = questions[questionIndex]['dropDownAnswers'];
          var tempList;
          bool lastDrop = false;
          if(dropdownAnswers != null){  //if dropDownMenu exist or is a dropDownQuestion
            tempList = dropdownAnswers[dropCount];
            if(dropCount == dropdownAnswers.length - 1){  //determine which list is the last drop down menu
              lastDrop = true;
            }
          }
          return Answer(() => answerQuestion(answer['score']), answer['text'], questions[questionIndex]['type'], tempList,lastDrop);
        }).toList()
      ],
    );
  }
}
