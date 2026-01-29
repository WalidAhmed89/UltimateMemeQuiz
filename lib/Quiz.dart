import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/home_screen.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/result_screen.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<StatefulWidget> createState() => _Quiz();
}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = '/HomeScreen';

  void switchScreen() {
    setState(() {
      activeScreen = '/QuestionsScreen';
      selectedAnswers = [];
    });
  }
  void restartQuiz() {
    setState(() {
      activeScreen = '/QuestionsScreen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = '/ResultScreen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomeScreen(switchScreen);

    if (activeScreen == '/QuestionsScreen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }else if (activeScreen == '/ResultScreen') {
      screenWidget = ResultScreen(switchScreen,choosenAnswers: selectedAnswers);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.green, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
