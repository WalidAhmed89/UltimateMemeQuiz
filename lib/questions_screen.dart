import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/custom_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() => _QuestionsScreen();
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionindex = 0;

  void answerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
        currentQuestionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionindex];
    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.barriecito(color: Colors.white, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CustomButton(onPress: (){answerQuestion(answer);}, text: answer),
            );
          }),
        ],
      ),
    );
  }
}
