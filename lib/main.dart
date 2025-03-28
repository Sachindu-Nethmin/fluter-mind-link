import 'package:flutter/material.dart';
import './result.dart';

import './quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. What is the primary function of an operating system?',
      'answers': [
            {'text': 'Manage hardware resources', 'score': 10},
            {'text': 'Develop software applications', 'score': -2},
            {'text': 'Ensure network security', 'score': -2},
            {'text': 'Create databases', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Which of the following is an example of an open-source operating system?',
      'answers': [
            {'text': 'Windows', 'score': -2},
            {'text': 'macOS', 'score': -2},
            {'text': 'Linux', 'score': 10},
            {'text':'Android','score': -2},
      ],
    },
    {
      'questionText': ' Q3. What does the acronym "URL" stand for in web technology?',
      'answers': [
            {'text': 'Uniform Resource Locator', 'score': 10},
            {'text': 'Universal Resource Locator', 'score': -2},
            {'text': 'Unilateral Resource Link', 'score': -2},
            {'text': 'Unified Resource List', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Which programming language is primarily used for building websites?',
      'answers': [
            {'text': 'Java', 'score': -2},
            {'text': 'C++', 'score': -2},
            {'text': 'HTML', 'score': 10},
            {'text': 'Swift', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. What is the main function of a firewall in a network?',
      'answers': [
            {'text': 'Improve internet speed','score': -2,},
            {'text': 'Store data securely','score': -2,},
            {'text': 'Send data to external devices','score': -2,},
            {'text': 'Block unauthorized access', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
        setState(() {
              _questionIndex = 0;
              _totalScore = 0;
        });
  }

  void _answerQuestion(int score) {
        _totalScore += score;
    
        setState(() {
             _questionIndex = _questionIndex + 1;
        });
        // ignore: avoid_print
        print(_questionIndex);
        if (_questionIndex < _questions.length) {
             // ignore: avoid_print
             print('We have more questions!');
        } else {
              // ignore: avoid_print
              print('No more questions!');
        }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mind Link',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                Colors.grey[900]!,
                Colors.black,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(_totalScore, _resetQuiz),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
