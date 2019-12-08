import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diabetes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Prediabetes Risk Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _totalScore = 0;
  var _questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'How old are you?',
      'answers': [
        {'text': 'Younger than 40 years', 'score': 0},
        {'text': '40–49 years', 'score': 1},
        {'text': '50–59 years', 'score': 2},
        {'text': '60 years or older', 'score': 3},
      ],
      'type': 'onPress'
    },
    {
      'questionText': 'Are you a man or woman?',
      'answers': [
        {'text': 'Man', 'score': 1},
        {'text': 'Woman', 'score': 0},
      ],
      'type': 'onPress'
    },
    {
      'questionText':
          'If you are a woman, have you ever been diagnosed with gestational diabetes?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
      'type': 'onPress'
    },
    {
      'questionText':
          'Do you have a mother, father, sister, or brother with diabetes?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
      'type': 'onPress'
    },
    {
      'questionText': 'What race or ethnicity best describes you?',
      'answers': [
        {'text': 'White or Caucasain', 'score': 0},
        {'text': 'Hispanic or Latino', 'score': 1},
        {'text': 'Black or African American', 'score': 1},
        {'text': 'Asian', 'score': 1},
        {'text': 'American Indian or Alaska Native', 'score': 1},
        {'text': 'Native Hawaiian or Other Pacific Islander', 'score': 1},
        {'text': 'Other', 'score': 0},
      ],
      'type': 'onPress'
    },
    {
      'questionText': 'Have you ever been diagnosed with high blood pressure?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
      'type': 'onPress'
    },
    {
      'questionText': 'Are you physically active?',
      'answers': [
        {'text': 'Yes', 'score': 0},
        {'text': 'No', 'score': 1},
      ],
      'type': 'onPress'
    },
    {
      'questionText': 'What is your BMI?',
      'answers': [
        {'text': 'Below 19', 'score': 0},
        {'text': '19-24', 'score': 0},
        {'text': '26-30', 'score': 1},
        {'text': '30+', 'score': 2},
      ],
      'type': 'onPress'
    },
//    {
//      'questionText': 'What is your BMI?',
//      'answers': [
//        {'text': 'Weight', 'score': 0},
//        {'text': 'Height', 'score': 0},
//      ],
//      'type': 'dropDown',
//      'dropDownAnswers': [
//        [
//          'Height',
//          '4\'10\'\'',
//          '4\'11\'\'',
//          '5\'0\'\'',
//          '5\'1\'\'',
//          '5\'2\'\'',
//          '5\'3\'\'',
//          '5\'4\'\'',
//          '5\'5\'\'',
//          '5\'6\'\'',
//          '5\'7\'\'',
//          '5\'8\'\'',
//          '5\'9\'\'',
//          '5\'10\'\'',
//          '5\'11\'\'',
//          '6\'0\'\'',
//          '6\'1\'\'',
//          '6\'2\'\'',
//          '6\'3\'\'',
//          '6\'4\'\'',
//        ],
//        ['Weight', '<146 lbs', '146-190 lbs', '191-254 lbs', '255+ lbs']
//      ],
//    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
