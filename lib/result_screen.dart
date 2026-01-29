import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_sammry.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.switchScreen,{super.key, required this.choosenAnswers});
  final void Function() switchScreen;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].text,
        'correct-answer': questions[i].answers[0],
        'user-answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numQuestions = questions.length;
    final numeCorrectAnswers = getSummaryData().where((data){
      return data['user-answer'] == data['correct-answer'];
    }).length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You answered $numeCorrectAnswers of $numQuestions questions correctly!',
          style: GoogleFonts.luckiestGuy(fontSize: 25, color: Colors.white70),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 70),
        QuestionsSammry(getSummaryData()),
        SizedBox(height: 40),
        OutlinedButton.icon(
          onPressed: switchScreen,
          icon: Icon(Icons.restart_alt_outlined, color: Colors.black),
          label: Text(
            "Restart Quiz",
            style: TextStyle(color: Colors.white,fontSize: 23),
          ),
        ),
      ],
    );
  }
}
